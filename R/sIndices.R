#' Calculates aggregate sector market capitalization time series
#'
#' sIndices() calculates aggregate market capitalizations
#' for all sectors in a given cross-section
#' for all months from company_timeseries start point to endpoint
#' in billions of EUR,
#' using the in-built datasets or data saved by the user.
#' The optional `path` parameter can point to the directory with saved versions
#' of the library datasets (with the saveData() function) to use them instead of
#' the built-in datasets.
#'
#'
#' @param country A character vector
#' @param path=NULL A character vector
#'
#' @returns an xts object with monthly periodicity and Sectors in alphabetical order as columns of core data
#'
#' @examples
#'
#' sIndices()  # Calculate for all countries, using the inbuilt data
#' sIndices(country = "Italy", path = "./")  # Calculate for Italy using data saved in the current working directory
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
sIndices <- function (country=NULL, path=NULL) {
  # Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `path`
  # zwraca w formie tabeli obiektu xts wartości łączne kapitalizacji
  # spółek we wszystkich sektorach (kolumny), dla poszczególnych miesięcy.
  # W przypadku braków notowań uzupełnia je w tył, potem wprzód.
  # Wartości przeliczone są do miliardów Euro na podstawie wartości końcowej kapitalizacji,
  # notowań poszczególnych spółek w zbiorze danych oraz notowań FX.
  # Domyślnie prezentowane są wyliczenia dla całego zbioru spółek
  # a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie.
  # Domyślnie funkcja wykorzystuje dane dołączone
  # a przy ustaleniu wartości parametru `path` ich  wersje zapisane na dysku użytkowanika (F.DB.1)
  sIndices <- NULL
  tryCatch(
    {
      # przypisanie datasetów do zmiennych
      if(is.null(path)) {
        company_data <- CurrentSectors::company_database
        company_ts <- CurrentSectors::company_timeseries
        forex_ts <- CurrentSectors::forex_timeseries
      } else {
        if(substr(path, nchar(path), nchar(path))!="/")
          path <- paste(path, "/", sep = "")
        load(paste(path, "company_database.rda", sep = ""))
        load(paste(path, "company_timeseries.rda", sep = ""))
        load(paste(path, "forex_timeseries.rda", sep = ""))
        company_data <- company_database
        company_ts <- company_timeseries
        forex_ts <- forex_timeseries
      }
      # zawężenie zakresu do kraju
      if(!is.null(country) && (country %in% company_data$Country)) {
        company_data <- company_data[company_data$Country==country,]
        company_ts <- company_ts[, names(company_ts) %in% company_data$Ticker]
      } else {
        if(!is.null(country)) {
          company_data <- NULL
          company_ts <- NULL
          forex_ts <- NULL
        }
      }
      # uzupełnienie pustych notowań
      company_ts <- na.locf(na.locf(company_ts), fromLast = TRUE)
      forex_ts <- na.locf(na.locf(forex_ts), fromLast = TRUE)
      # wyliczenie notowan relatywnych do ostatniego
      last_v <- tail(company_ts, 1)
      last_vm <- matrix(rep(last_v, nrow(company_ts)),
                        nrow = nrow(company_ts), ncol = ncol(company_ts), byrow = TRUE)
      rel_to_lastm <- company_ts / last_vm
      # wyliczenie kapitalizacji relatywnych do ostatniej
      last_caps <- t(matrix(company_data$MarketCap))
      last_capsm <- matrix(rep(last_caps, nrow(company_ts)),
                           nrow = nrow(company_ts), ncol = ncol(company_ts), byrow = TRUE)
      # obiekt xts caps zawiera szereg kapitalizacji w czasie dla wszystkich spólek przekroju
      caps <- last_capsm * rel_to_lastm
      # przeliczenia kapitalizacji do euro
      euro_caps <- caps
      usd_caps <- caps[, names(caps) %in% company_data$Ticker[company_data$Currency=="USD"]]
      if(ncol(usd_caps)>0) {
        usd_rates <- matrix(rep(forex_ts$EURUSD, ncol(usd_caps)), nrow = nrow(forex_ts), ncol = ncol(usd_caps))
      }
      if(exists("usd_rates")){
        euro_caps[,names(euro_caps) %in% names(usd_caps)] <- (usd_caps / usd_rates)
      }
      # sumowanie kpitalizacji sektorami
      sectors <- unique(company_data$Sector)
      sectors <- sectors[order(sectors)]
      sIndices <- matrix(NA, nrow = nrow(euro_caps), ncol = length(sectors))
      colnames(sIndices) <- sectors
      sIndices <- xts(sIndices, order.by = index(euro_caps))
      for(i in 1:ncol(sIndices)) {
        companies <- company_data$Ticker[company_data$Sector==colnames(sIndices[,i])]
        series <- euro_caps[, names(euro_caps) %in% companies]
        totals <- rowSums(series)
        sIndices[,i] <- totals / 1000000000 # mld EUR - billions of Euro
      }
    },
    error = function(cond) {
      message(cat("\nCalculation of sector capitalizations was unsuccesful"))
    },
    finally = {
      return(sIndices)
    }
  )
}
