#' Plots sector total returns comparison time series for two sectors
#'
#' sIndicesTRCompChart() plots total returns comparison
#' of two user-defined sectors in user-defined countries
#' where the market capitalization in the first period
#' is treated as the base value (=100).
#' Return values are calculated in country's base currency
#' (are not all recalculated to Euros).
#'
#' The optional `path` parameter can point to the directory with saved versions
#' of the library datasets (with the saveData() function) to use them instead of
#' the built-in datasets.
#'
#'
#' @param country1 A character vector
#' @param country2 A character vector
#' @param sector1 A character vector
#' @param sector2 A character vector
#
#' @param path=NULL A character vector
#'
#' @returns a plot
#'
#' @examples
#'
#' sIndicesTRCompChart(country1 = "Belgium", country2 = "USA", sector1 = "Technology", sector2 = "Technology")  # Compare the performance of the Technology sector in USA and Belgium
#'
#' sIndicesTRCompChart(country1 = "France", country2 = "France", sector1 = "Basic Materials", sector2 = "Healthcare")  # Compare the performance of Basic Materials and Healthcare sectors in France
#'
#' sIndicesTRCompChart(country1 = "Spain", country2 = "Netherlands", sector1 = "Consumer Cyclical", sector2 = "Consumer Defensive")
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export

sIndicesTRCompChart <- function(country1, country2, sector1, sector2, path=NULL) {
  # Funkcja z obligatoryjnymi argumentami nazw dwóch państw (country1, country2),
  # nazw dwóch sektorów (sector1, sector2) oraz opcjonalnym parametrem path
  # zwraca w formie wykresu dwóch szeregów czasowych wartości indeksów
  # jednopodstawowych kapitalizacji łącznej spółek w tych państwach
  # oraz sektorach w poszczególnych miesiącach, dla których dostępne są notowania w bazie.
  # Wartość w pierwszym okresie = 100. Bazą wycen są notowania w walutach macierzystych.
  # Umożliwia również porównania w tym samym państwie lub tym samym sektorze.
  # Wykres zawiera informatywny tytuł oraz legendę.
  # Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustalenia wartości
  # parametru path ich aktualizowane wersje zapisane na dysku użytkowanika (F.DB.1)
  sindicestrcompchart <- NULL
  sec1 <- NULL
  sec2 <- NULL
  tryCatch(
    {
      if(is.null(path)) {
        forex_ts <- CurrentSectors::forex_timeseries
      } else {
        if(substr(path, nchar(path), nchar(path))!="/")
          path <- paste(path, "/", sep = "")
        load(paste(path, "forex_timeseries.rda", sep = ""))
        forex_ts <- forex_timeseries
      }
      sindices1 <- sIndices(country = country1, path = path)
      sindices2 <- sIndices(country = country2, path = path)
      sectors1 <- colnames(sindices1)
      sectors2 <- colnames(sindices2)
      if(country1 != "USA") {
        if(sector1 %in% sectors1) {
          sec1 <- sector1
          ts1 <- sindices1[,names(sindices1)==sec1]
          fval1 <- rep(ts1[1], length(ts1)) # first value converted to series
          tr1 <- (ts1/fval1)*100
        }
      } else {
        #country1 is USA sIndices output in Euro, need to convert back
        if(sector1 %in% sectors1) {
          sec1 <- sector1
          ts1 <- sindices1[,names(sindices1)==sec1]
          ts1 <- ts1 * forex_ts
          fval1 <- rep(ts1[1], length(ts1))
          tr1 <- (ts1/fval1)*100
        }
      }
      if(country2 != "USA") {
        if(sector2 %in% sectors2) {
          sec2 <- sector2
          ts2 <- sindices2[,names(sindices2)==sec2]
          fval2 <- rep(ts2[1], length(ts2)) # first value converted to series
          tr2 <- (ts2/fval2)*100
        }
      } else {
        #country2 is USA
        if(sector2 %in% sectors2) {
          sec2 <- sector2
          ts2 <- sindices2[,names(sindices2)==sec2]
          ts2 <- ts2 * forex_ts
          fval2 <- rep(ts2[1], length(ts2))
          tr2 <- (ts2/fval2)*100
        }
      }
      if(!(is.null(sec1) | is.null(sec2))) {
        names <- c(paste(country1, ", ", sec1, sep = ""), paste(country2, ", ", sec2, sep = ""))
        series <- cbind(tr1, tr2)
        date <- index(series)[1]
        title <- paste("Total returns sector comparison\n", date, "=100", sep = "")
        max <- round(max(series)*1.1, digits = -1)
        colpalette <- c("aquamarine4", "cornflowerblue")
        sindicestrcompchart <- plot(series,
                                    type = "l",
                                    main = title,
                                    format.labels = "%Y-%m",
                                    yaxis.right = FALSE,
                                    ylim = c(0, max),
                                    col = colpalette,
                                    lwd = 4)
        sindicestrcompchart <- addLegend("topleft", on=0,
                                         lty = rep(1, 2),
                                         lwd = rep(4, 2),
                                         legend.names = names,
                                         col=colpalette)
      }
    },
    error = function(cond) {
      message(cat("\nPlot creation was unsuccesful"))
    },
    finally = {
      if(is.null(sec1) | is.null(sec2)) {
        message(cat("\nPlot creation was unsuccesful"))
      }
      return(sindicestrcompchart)
    }
  )
}
