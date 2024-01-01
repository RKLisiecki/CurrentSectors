#' Calculate shares of each sector's market cap. in total market cap.
#'
#' sStructure() calculates each Sector's market capitalization
#' share in total market capitalization of companies in the dataset,
#' in the given country, for the most recent market cap. estimate
#' using the in-built datasets or data saved by the user.
#' The optional `path` parameter can point to the directory with saved versions
#' of the library datasets (with the saveData() function) to use them instead of
#' the built-in datasets.
#'
#' Function also prints out the total market cap of all companies
#' in a given country, in billions of EUR.
#'
#' @param country A character vector
#' @param path=NULL A character vector
#'
#' @returns a dataframe
#'
#' @examples
#'
#' sStructure("USA")  # Sector market cap shares of American companies
#' sStructure(country = "Italy", path = "./")  # Sector market cap shares of Italian companies, calculated from user saved datasets
#'
#'
#' # Author: R. Karol Lisiecki
#'
#' @export
sStructure <- function(country, path=NULL) {
  # Funkcja z obligatoryjnym parametrem nazwy państwa (`country`)
  # oraz opcjonalnym parametrem `path` zwraca w formie jednokolumnowej
  # tabeli z nagłówkiem (`data.frame`) aktualne udziały łączne spółek
  # poszczególnych sektorów w kapitalizacji łącznej spółek w państwie, w procentach.
  # Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu
  # wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1).
  # Wydruk tabeli poprzedzony jest wydrukiem z informacji o kapitalizacji
  # łącznej (w mld EUR) spółek z tego państwa w zbiorze danych.
  sstructure <- NULL
  tryCatch(
    {
      # przypisanie datasetów do zmiennych
      if(is.null(path)) {
        company_data <- CurrentSectors::company_database
      } else {
        if(substr(path, nchar(path), nchar(path))!="/") {
          path <- paste(path, "/", sep = "")
        }
        load(paste(path, "company_database.rda", sep = ""))
        company_data <- company_database
      }
      # zawężenie zakresu do kraju
      if(country %in% company_data$Country) {
        company_data <- company_data[company_data$Country==country,]
        sectors <- unique(company_data$Sector)
        sectors <- sectors[order(sectors)]
        sstructure <- data.frame(matrix(nrow = 1, ncol = length(sectors)))
        colnames(sstructure) <- sectors
        cap_sum <- sum(company_data$EURMarketCap)
        cat(paste("Total market capitalization of companies in the dataset, \nwhich are from ", country, " is: ", round((cap_sum/1e9), 3), " billions of EUR.\n", sep = ""))
        for(i in 1:length(sectors)){
          sec_sum <- sum(company_data$EURMarketCap[company_data$Sector==sectors[i]])
          sec_pct <- (sec_sum/cap_sum)*100
          sstructure[i] <- sec_pct
        }
        sstructure <- t(round(sstructure, 2))
        colnames(sstructure) <- "SectorMarketCapSharePct"
      } else {
        sstructure <- message(cat("\nCalculation was unsuccesful"))
      }
    },
    error = function(cond) {
      message(cat("\nCalculation was unsuccesful"))
    },
    finally = {
      return(sstructure)
    }
  )
}
