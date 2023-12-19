# [not build ready]
# Author: R. Karol Lisiecki
# printSectorStructure function educational mock
#-- ładowanie danych
#company_database <- read_csv("company_database_procured.csv")

#-- function definition
printSectorStructure <- function(company_database) {
  #-- creating the data frame
  
  # finding sector and industry pairs
  sec_inds <- unique(company_database[,c(4:5)])
  # alphabetic ordering of items
  sec_inds <- sec_inds[order(sec_inds$Sector, sec_inds$Industry),]
  
  # adding column for Ticker and Name
  sec_inds$Ticker <- NA
  sec_inds$Name <- NA
  
  # lookup of highest market cap companies
  for(i in 1: nrow(sec_inds)) {
    # set of firms of a given sector and industry
    firmy <- company_database[company_database$Sector == sec_inds$Sector[i] &
                                company_database$Industry == sec_inds$Industry[i],
    ]
    # ordering and extraction
    firmy <- firmy[order(firmy$EURMarketCap, decreasing = TRUE), ]
    firma <- firmy[1, ]
    
    # adding a row with the company data
    sec_inds$Ticker[i] <- firma$Ticker
    sec_inds$Name[i] <- firma$Name
  }
  
  # creating a set of unique sectors
  sec <- unique(sec_inds$Sector)
  
  #-- drawing a nested list
  for(i in 1:length(sec)) {
    # type conversion
    sector <- as.character(sec[i])
    # sampling a ticker for the `industry` branch
    ticker <- sample(as.character(sec_inds$Ticker[sec_inds$Sector==sector]), 1)
    # company name lookup
    name <- as.character(sec_inds$Name[sec_inds$Ticker==ticker])
    # line item creation
    sec_line <- paste("|-", sector, " (i.e.", name, ", ", ticker, ")\n", sep = "")
    cat(sec_line) # sector printout
    Sys.sleep(0.2) # waitout
    
    # checkup of the number of industries in the printed sector
    no_of_indsts <- nrow(sec_inds[sec_inds$Sector==sektor,])
    
    # drawing the industry nested elements
    for(j in 1:no_of_indsts) {
      industry <- sec_inds[sec_inds$Sector==sector,][j, 2]
      ticker <- sec_inds[sec_inds$Sector==sector,][j, 3]
      name <- sec_inds[sec_inds$Sector==sector,][j, 4]
      ind_line <- paste("  |---", industry, " (i.e. ", name, ", ", ticker, ")\n", sep = "")
      cat(ind_line)
      Sys.sleep(0.03)
    }
    cat("\n")
    Sys.sleep(0.1)
  }
}

#-- function call
#printSectorStructure(company_database)
