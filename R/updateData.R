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
#'
#' updateData("./")  # Updates datasets stored in the current working directory
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
      todmonth <- format(today, "%m")
      # update dokonywany jest tylko w przypadku rozp. kolejnego mies.
      month_diff <- as.numeric(todmonth) - as.numeric(last_month)
      if(month_diff<2) {
        info <- "Data can't be updated yet"
      } else {
        symbols <- colnames(company_timeseries)
        dates <- seq(from = last_date, to = today, by = "days")
        mendings <- endpoints(dates, on = "months")
        # miesięczne szeregi z YF są datowane na pierwszy dz. mes.
        fdays <- dates[mendings+1]
        fdays <- fdays[2:(length(fdays)-2)]
        # w bazie biblioteki używany jest ost. dz. mies. lub notowań w mies.
        dbdates <- dates[mendings]
        dbdates <- dbdates[2:(length(dbdates)-1)]

        corematrix <- matrix(NA, nrow = length(dbdates), ncol = length(symbols))
        colnames(corematrix) <- symbols
        cat("Updating time series. This will take a while.\n")
        cat("Progress: the bottom dotted line elongates when every 10% of the data is downloaded\n")
        cat("..........\n")
        checkpoint <- floor(length(symbols)/10)
        for(i in 1:length(symbols)) {
          symbol <- colnames(corematrix)[1]
          data <- getSymbols(symbol, from = fdays[1], to = fdays[length(fdays)]+1, periodicity = "monthly", auto.assign = FALSE)
          corematrix[, i] <- data[, 4]
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
