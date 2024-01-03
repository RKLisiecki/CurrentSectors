#' Calculate a technical analysis report for companies in a given country and sector crossection
#'
#' TAReport() calculates a technical analysis report
#' for a defined coutry and sector crossection.
#' Function assesses the technical sentiment for each company based on two indicators.
#' First, the Relative Strength Indicator (SMA based 14-period RSI), where
#' value equal or below 30 is considered oversold,
#' equal or above 70 overbougt and between those values a no signal zone.
#' Second, the 11-period Simple Moving Average in relation to the last close price,
#' where current value above the SMA is considered bullish and below - bearish.
#'
#' The optional `path` parameter can point to the directory with saved versions
#' of the library datasets (with the saveData() function) to use them instead of
#' the built-in datasets.
#'
#' @param country A character vector
#' @param sector A character vector
#' @param path=NULL A character vector
#'
#' @returns a dataframe
#'
#' @examples
#'
#' TAReport(country = "USA", sector = "Technology") # Technical analysis report for American companies
#' TAReport(country = "Portugal", sector = "Consumer Defensive", path = "./") # Technical analysis report for Portugese companies, calculated using saved datsets
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
TAReport <- function(country, sector, path=NULL) {
  # Funkcja z obligatoryjnymi parametrami nazwy państwa (country)
  # oraz nazwy sektora (sector) i opcjonalnym parametrem path zwraca w formie tabeli
  # (struktury data.frame) raport analizy technicznej wszystkich spółek
  # wybranego przekroju sektorowo-geograficznego. Wiersze tabeli odpowiadają kolejnym spółkom.
  # Kolumny tabeli, to Name - nazwa spółki, Ticker - użyty symbol giełdowy,
  # Industry - branża spółki, MA - kategoria trendu notowań (bullish lub bearish)
  # ustalona na podstawie relacji aktualnej ceny do wartości 11-okresowej średniej ruchomej,
  # RSI - kategoria oscylatora Relative Strength Index (overbought, no signal lub oversold)
  # ustalona na podstawie 14-okresowej wartości wskaźnika RSI w jednym z przedziałów (<70-100>, [30-70], <0, 30>).
  # Domyślnie funkcja wykorzystuje dane dołączone
  # a w przypadku ustaleniu wartości parametru path ich wersje zapisane na dysku użytkownika (F.DB.1)
  tareport <- NULL
  tryCatch(
    {
      if(is.null(path)) {
        company_data <- CurrentSectors::company_database
        company_ts <- CurrentSectors::company_timeseries
      } else {
        if(substr(path, nchar(path), nchar(path))!="/")
          path <- paste(path, "/", sep = "")
        load(paste(path, "company_database.rda", sep = ""))
        load(paste(path, "company_timeseries.rda", sep = ""))
        company_data <- company_database
        company_ts <- company_timeseries
      }
      if(!is.null(country) && (country %in% company_data$Country) && (sector %in% company_data$Sector)) {
        company_data <- company_data[company_data$Country==country & company_data$Sector==sector,]
        company_ts <- company_ts[, names(company_ts) %in% company_data$Ticker]
        company_ts <- na.locf(na.locf(company_ts), fromLast = TRUE)
        tareport <- data.frame(
          Name <- company_data$Name,
          Ticker <- company_data$Ticker,
          Industry <- company_data$Industry,
          MA <- NA,
          RSI <- NA
        )
        colnames(tareport) <- c("Name", "Ticker", "Industry", "MA", "RSI")
        for(i in 1:nrow(tareport)) {
          rsinum <- as.numeric(RSI(company_ts[, names(company_ts)==tareport$Ticker[i]], n = 14)[nrow(company_ts)])
          tareport$RSI[i] <- ifelse(rsinum >= 70, "overbought", ifelse(rsinum <= 30, "oversold", "no signal"))
          smanumdiff <- as.numeric(company_ts[, names(company_ts)==tareport$Ticker[i]][nrow(company_ts)]) -
            as.numeric(SMA(company_ts[, names(company_ts)==tareport$Ticker[i]], n = 11)[nrow(company_ts)])
          tareport$MA[i] <- ifelse(smanumdiff >= 0, "bullish", "bearish")
        }
        tareport <- tareport[order(tareport$Industry, tareport$Name, decreasing = FALSE), ]
      } else {
        tareport <- message(cat("\nWrong query! \nCalculation was unsuccesful"))
      }
    },
    error = function(cond) {
      message(cat("\nCalculation was unsuccesful"))
    },
    finally = {
      return(tareport)
    }
  )
}
