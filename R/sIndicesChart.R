#' Plots aggregate sector market capitalization time series
#'
#' sIndicesChart() plots aggregate market capitalizations
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
#' @returns a plot
#'
#' @examples
#'
#' sIndicesChart()  # Chart for all countries combined, using the inbuilt data
#' sIndicesChart(country = "Netherlands", path = "./")  # Calculate for the Netherlands using data saved in the current working directory
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
sIndicesChart <- function (country=NULL, path=NULL) {
  # Funkcja z opcjonalnymi parametrami nazwy państwa (country) oraz path
  # zwraca w formie wykresu zbiorczego szeregów czasowych
  # (po jeden szereg na sektor) wartości kapitalizacji łącznej w Euro
  # wszystkich spółek dla każdego z sektorów w poszczególnych miesiącach,
  # dla których dostępne są notowania w bazie.
  # Wartości przeliczone są do waluty Euro na podstawie notowań poszczególnych
  # spółek w zbiorze danych oraz notowań FX.
  # Domyślnie prezentowane są wyliczenia dla całego zbioru spółek
  # a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie.
  # Wykres zawiera informatywny tytuł oraz legendę.
  # Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustaleniu
  # wartości parametru path ich wersje zapisane na dysku użytkownika (F.DB.1)
  sindiceschart <- NULL
  tryCatch(
    {
      sindices <- sIndices(country = country, path = path)
      country <- country
      if(!is.character(country) | is.null(country)) {
        country <- "Total"
      } else {
        country <- paste(country, "'s", sep = "")
      }
      title <- paste(country, " market capitalization \nwithin sectors, in bn Euro", sep = "")
      max <- max(sindices)
      digits <- floor(log(x = max, base = 10))-1
      max <- round(max*1.3, digits = -digits)
      secnames <- colnames(sindices)
      nitems <- length(secnames)
      colpalette <- c("black", "aquamarine", "aquamarine4", "azure4", "antiquewhite3",
                      "cornflowerblue", "brown1", "brown4", "darkorchid4", "deepskyblue4", "goldenrod4")

      sindiceschart <- plot(sindices,
                            type = "l",
                            main = title,
                            format.labels = "%Y-%m",
                            yaxis.right = FALSE,
                            ylim = c(0, max),
                            col = colpalette[1:nitems],
                            lwd = 4)
      sindiceschart <- addLegend("topleft", on=0,
                                 lty = rep(1, nitems),
                                 lwd = rep(4, nitems),
                                 legend.names = secnames,
                                 col=colpalette[1:nitems])
    },
    error = function(cond) {
      message(cat("\nPlot creation was unsuccesful"))
    },
    finally = {
      return(sindiceschart)
    }
  )
}
