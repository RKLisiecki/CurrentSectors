#' Plots a pie-chart of sector market cap shares for companies in a given country
#'
#' sStructureChart() plots a pie-chart of shares of each sector
#' in total market capitalization of companies in a given country
#' using the in-built datasets or data saved by the user.
#' The optional `path` parameter can point to the directory with saved versions
#' of the library datasets (with the saveData() function) to use them instead of
#' the built-in datasets.
#'
#' The sector labels are augmented with percentatge numbers.
#' The plot title states the country of investigation.
#'
#' @param country A character vector
#' @param path=NULL A character vector
#'
#' @returns a plot
#'
#' @examples
#'
#' sStructureChart("USA")  # Sector market cap shares chart of American companies
#' sStructureChart(country = "Italy", path = "./")  # Sector market cap shares chart of Italian companies, calculated using user saved datasets
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
sStructureChart <- function(country, path=NULL) {
  # Funkcja z obligatoryjnym parametrem nazwy państwa (`country`) oraz opcjonalnym `path`
  # zwraca wykres powierzchniowy (pie-chart) udziałów poszczególnych sektorów
  # w kapitalizacji łącznej spółek w państwie. Wykres zawiera informatywny tytuł.
  # Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu
  # wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1)
  sstructurechart <- NULL
  tryCatch(
    {
      colpalette <- c("black", "aquamarine", "aquamarine4", "azure4", "antiquewhite3",
                      "cornflowerblue", "brown1", "brown4", "darkorchid4", "deepskyblue4", "goldenrod4")
      sstructure <- sStructure(country, path)
      nosecs <- length(sstructure)
      labels <- as.character(matrix(nrow = nosecs, ncol = 1))
      for(i in 1:nosecs) {
        labels[i] <- paste(rownames(sstructure)[i], " ", as.character(sstructure[i]), " %", sep = "")
      }
      names(sstructure) <- labels
      title <- paste("Sector market capitalization\nstructure of companies in ", country, sep = "")
      sstructurechart <- pie(sstructure, clockwise = TRUE, main = title, col = colpalette[1:nosecs], cex = 0.5)
    },
    error = function(cond) {
      message(cat("\nPlot creation was unsuccesful"))
    },
    finally = {
      return(sstructurechart)
    }
  )
}
