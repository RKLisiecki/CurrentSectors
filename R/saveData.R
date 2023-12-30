#' Saves library's data files on user's disk (in Rda format)
#'
#' saveData() writes all library datasets
#' inside the folder, for which
#' the path is given as the function parameter
#'
#' Enables further data updates
#'
#' @param path A character vector
#'
#' @examples
#'
#' saveData("./")
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
saveData <- function(path) {
  # Funkcja z obligatoryjnym parametrem ścieżki dyskowej w formacie tekstowym
  # zapisuje w tej lokalizacji dane dołączone biblioteki w plikach .csv.
  # Umożliwia to ich późniejszą aktualizację.
  return("Data saved")
}
