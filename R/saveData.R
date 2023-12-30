#' Saves library's data files on user's disk (in Rda format)
#'
#' saveData() writes all library datasets
#' inside an existing folder, when
#' it's path is given as the function parameter.
#'
#' Enables further data updates
#'
#' @param path A character vector
#'
#' @examples
#'
#' saveData("./")  # Saves datasets to the current working directory
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
saveData <- function(path) {
  # Funkcja z obligatoryjnym parametrem ścieżki dyskowej w formacie tekstowym
  # zapisuje w tej lokalizacji dane dołączone biblioteki w plikach .Rda.
  # Umożliwia to ich późniejszą aktualizację.
  tryCatch(
    {
      info <- NULL
      if(substr(path, nchar(path), nchar(path))=="/")
        path <- substr(path, 1, nchar(path)-1)
      if(dir.exists(path)) {
        company_database <- CurrentSectors::company_database
        company_timeseries <- CurrentSectors::company_timeseries
        forex_timeseries <- CurrentSectors::forex_timeseries
        save(company_database,
             file = paste(path, "/company_database.rda", sep = ""))
        save(company_timeseries,
             file = paste(path, "/company_timeseries.rda", sep = ""))
        save(forex_timeseries,
             file = paste(path, "/forex_timeseries.rda", sep = ""))
        info <- paste("Data save in: ", path, "\nwas succesful.")
      }
      else info <- "Non-existent directory,\n data save unsuccesful."
    },
    error = function(cond) {
      message(cat("\nData save was unsuccesful."))
    },
    finally = {
      return(cat(info))
    }
  )
}
