#' Produces a dataframe of companies from a given country and sector or industry
#'
#' `listCompaniese()` produces a dataframe
#' of the companies of a given
#' country and sector (or industry) crossection.
#'
#' Requires the `country` parameter and a second parameter
#' either the `sector` or the `industry`.
#'
#' The optional `market_cap_thresh` parameter signifies
#' Market Cap Threshold value (in Euros), below which the companies
#' should be cut off from the desired result.
#'
#' @param country A character vector
#' @param sector A character vector
#' @param industry A character vector
#' @param market_cap_thresh A number
#'
#' @returns A dataframe of companies with 6 columns (Name, Ticker, Sector, Industry, Currency)
#' @examples
#'
#' listCompanies("Italy", "Technology")#'
#' listCompanies("USA", industry = "Solar", market_cap_thresh = 1000000000)
#'
#' # Author: R. Karol Lisiecki
#'
#' @export

listCompanies <- function(country, sector=NULL, industry=NULL, market_cap_thresh=NULL) {
  if((!is.null(sector)) & (!is.null(industry)))
    return(cat("Please provide sector OR industry parameter, not both."))
  if((is.null(sector)) & (is.null(industry)))
    return(cat("Please provide sector OR industry parameter."))
  cols <- c(1:2, 4:5, 3, 6, 12)
  tryCatch(
    {
      ifelse(is.null(industry),
             result <- company_database[company_database$Country==country & company_database$Sector==sector, cols],
             result <- company_database[company_database$Country==country & company_database$Industry==industry, cols])
      if(!is.null(market_cap_thresh))
             result <- result[result$EURMarketCap > market_cap_thresh, ]
      result <- result[,1:6]
      if(sum(is.na(result)) > 0 | nrow(result) < 1)
        result <- "Nothing here."
    },
    error = function(cond) {
      message(paste("Can't procure the desired list."))
    },
    finally = {
      return(result)
    }
  )
}

