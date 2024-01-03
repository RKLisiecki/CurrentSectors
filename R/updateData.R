#' Updates the library's datasets saved on disk
#'
#' updateData() updates company time series,
#' forex time series, company market capitalization data
#' and metadata.
#'
#' Update can take under an hour,
#' it's status can be observed by watching the progress bar.
#' User needs to wait until the beginning of the next month to update EOM data.
#'
#' @param path A character vector
#'
#' @examples
#' # Updates datasets stored in the current working directory
#' # this is commented because it takes up to fifteen minutes.
#'
#' # updateData("./")
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
updateData <- function(path) {
  # Funkcja z obligatoryjnym parametrem ścieżki dyskowej (jak w F.DB.1)
  # aktualizuje szeregi czasowe notowań
  # uprzednio zapisanych przez użytkownika funkcją saveData(path).
  info <- NULL
  tryCatch(
    {
      if(substr(path, nchar(path), nchar(path))!="/") {
        path <- paste(path, "/", sep = "")
      }
      load(paste(path, "company_database.rda", sep = ""))
      load(paste(path, "company_timeseries.rda", sep = ""))
      load(paste(path, "forex_timeseries.rda", sep = ""))
      company_database <- company_database
      company_timeseries <- company_timeseries
      forex_timeseries <- forex_timeseries

      # sprawdzenie podatności na aktualizację
      last_date <- index(company_timeseries)[nrow(company_timeseries)]
      last_month <- format(last_date, "%m")
      today <- Sys.Date()
      day_diff <- as.numeric(today - last_date)
      # update dokonywany jest tylko w po 31 dnich od ost. daty aktualizacji
      if(day_diff<31) {
        info <- paste("Data can't be updated yet, wait ", (31-day_diff), " more days", sep = "")
      } else {
        symbols <- colnames(company_timeseries)
        dates <- seq(from = last_date, to = today, by = "days")
        mendings <- endpoints(dates, on = "months")
        #
        fdays <- dates[mendings]
        fdays <- fdays[2:(length(fdays)-1)]
        # w bazie biblioteki używany jest ost. dz. mies. lub notowań w mies.
        dbdates <- fdays

        corematrix <- matrix(NA, nrow = length(dbdates), ncol = length(symbols))
        colnames(corematrix) <- symbols
        cat("Updating time series. This will take a while.\n")
        cat("Progress: the bottom dotted line elongates when every 10% of the data is downloaded\n")
        cat("..........\n")
        checkpoint <- floor(length(symbols)/10)
        start_day <- as.Date(paste(substr(as.character(fdays[1]), start = 1, stop = 8), "01", sep = ""))
        for(i in 1:length(symbols)) {
          symbol <- colnames(corematrix)[i]
          data <- getSymbols(symbol, from = start_day, to = fdays[length(fdays)]+1, periodicity = "monthly", auto.assign = FALSE)
          # Yahoo Finance sometimes dates monthlies on the beginnings, sometimes on endings of months
          ifelse(start(data) < start_day, corematrix[, i] <- as.numeric(data[2:nrow(data), 4]), corematrix[, i] <- as.numeric(data[, 4]))
          if(i%%checkpoint==0){
            cat(".")
          }
        }
        added_ts <- xts(corematrix, order.by = dbdates)
        cat("Updating FX rates.\n")
        added_fx <- getSymbols("EURUSD=X", from = fdays[1], to = fdays[length(fdays)]+1, periodicity = "monthly", auto.assign = FALSE)
        added_fx <- added_fx[,4]
        added_fx <- xts(added_fx, order.by = dbdates)
        forex_timeseries <- rbind(forex_timeseries, added_fx)

        cat("Updating company database.\n")
        company_database$TimSeriesEnd <- dbdates[length(dbdates)]
        for(i in 1:length(symbols)) {
          symbol <- symbols[i]
          currency <- company_database$Currency[company_database$Ticker==symbol]
          fxrate <- as.numeric(forex_timeseries[length(forex_timeseries)])
          currentquote <- added_ts[nrow(added_ts), i]
          lastquote <- company_timeseries[nrow(company_timeseries), i]
          ratio <- as.numeric(currentquote)/as.numeric(lastquote)
          newmarketcap <- ratio * company_database$MarketCap[company_database$Ticker==symbol]
          company_database$MarketCap[company_database$Ticker==symbol] <- newmarketcap
          company_database$MarketCapUpdate[company_database$Ticker==symbol] <- as.Date(dbdates[length(dbdates)])
          if(currency=="EUR") {
            company_database$EURMarketCap[company_database$Ticker==symbol] <- newmarketcap
            company_database$USDMarketCap[company_database$Ticker==symbol] <- (newmarketcap * fxrate)
          } else {
            company_database$USDMarketCap[company_database$Ticker==symbol] <- newmarketcap
            company_database$EURMarketCap[company_database$Ticker==symbol] <- (newmarketcap / fxrate)
          }
        }
        company_timeseries <- rbind(company_timeseries, added_ts)

        save(company_database, file = paste(path, "company_database.rda", sep = ""))
        save(company_timeseries, file = paste(path, "company_timeseries.rda", sep = ""))
        save(forex_timeseries, file = paste(path, "forex_timeseries.rda", sep = ""))

        info <- "\nData has been succesfully updated."
      }
    },
    error = function(cond) {
      message(cat("\nUser data update unsuccesful."))
    },
    finally = {
      return(cat(info))
    }
  )
}
