#' Print the nested structure of sectors and industries
#'
#' `printSectorStructure()` handles a console printout
#' of the nested strucure of sectors and industries
#' available in the `company_database` dataset.
#'
#' For each sector and industry it also prints an example
#' of a company name and Yahoo ticker on the same line.
#'
#' Function prints the result slowly to simulate
#' an actual printout.
#'
#' @returns [no explicit returns, just a console printout]
#' @examples
#' printSectorStructure()
#'
#' # Author: R. Karol Lisiecki
#'
#' @export

#-- function definition
printSectorStructure <- function() {
  company_database <- CurrentSectors::company_database
  sec_inds <- unique(company_database[,c(4:5)])
  sec_inds <- sec_inds[order(sec_inds$Sector, sec_inds$Industry),]
  sec_inds$Ticker <- NA
  sec_inds$Name <- NA
  for(i in 1: nrow(sec_inds)) {
    # set of firms of a given sector and industry
    firmy <- company_database[company_database$Sector == sec_inds$Sector[i] &
                                company_database$Industry == sec_inds$Industry[i],
    ]
    firmy <- firmy[order(firmy$EURMarketCap, decreasing = TRUE), ]
    firma <- firmy[1, ]
    sec_inds$Ticker[i] <- firma$Ticker
    sec_inds$Name[i] <- firma$Name
  }
  sec <- unique(sec_inds$Sector)
  #-- drawing a nested list
  for(i in 1:length(sec)) {
    sector <- as.character(sec[i])
    # sampling a ticker for the `industry` branch
    ticker <- sample(as.character(sec_inds$Ticker[sec_inds$Sector==sector]), 1)
    name <- as.character(sec_inds$Name[sec_inds$Ticker==ticker])
    # line item creation
    sec_line <- paste("|-", sector, " (i.e.", name, ", ", ticker, ")\n", sep = "")
    cat(sec_line)
    Sys.sleep(0.03)
    no_of_indsts <- nrow(sec_inds[sec_inds$Sector==sector,])
    # drawing the industry nested elements
    for(j in 1:no_of_indsts) {
      industry <- sec_inds[sec_inds$Sector==sector,][j, 2]
      ticker <- sec_inds[sec_inds$Sector==sector,][j, 3]
      name <- sec_inds[sec_inds$Sector==sector,][j, 4]
      ind_line <- paste("  |---", industry, " (i.e. ", name, ", ", ticker, ")\n", sep = "")
      cat(ind_line)
      Sys.sleep(0.01)
    }
    cat("\n")
    Sys.sleep(0.02)
  }
}
