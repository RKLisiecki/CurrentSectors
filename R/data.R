#' Company overviews of 2028 European and American stocks (from Yahoo Finance)
#'
#' A subset of Yahoo Finance profile and statistics data of 1161 US and
#' 943 European companies (BE, DE, ES, FR, IT, NL, PT)
#' plus metadata about their stock timeseries in this library
#' plus their USD and EUR market cap values after conversion
#' at rate dated at last observation.
#'
#' @format A data frame with 2026 rows and 13 columns:
#' \describe{
#'   \item{Name}{Company name on one of the Euronext exchanges or Polish brokerage houses}
#'   \item{Ticker}{Company stock ticker used to collect data from Yahoo Finance}
#'   \item{Country}{Country name defined with the ISIN of the security}
#'   \item{Sector}{Company sector of operation defined by Yahoo Finance}
#'   \item{Industry}{Company industry of operation defined by Yahoo Finance}
#'   \item{Currency}{Stock quote currency of the particular ticker}
#'   \item{NoOfEmployees}{Number of company employees in December 2023}
#'   \item{MarketCap}{Company market capitalization in quote currency units}
#'   \item{MarketCapUpdate}{Day of the market capitalization sum adequacy}
#'   \item{TimeSeriesStart}{Beginning date of timeseries in the corresponding `company_timesries` dataset}
#'   \item{TimeSeriesEnd}{End date of timeseries in the corresponding `company_timesries` dataset}
#'   \item{EURMarketCap}{Market capitalization in Euros}
#'   \item{USDMarketCap}{Market capitalization in US Dollars}
#' }
#' @source <https://finance.yahoo.com/quote/>
"company_database"

#' Historical stock prices - monthly closes of 2026 stocks (from Yahoo Finance)
#'
#' A subset of Yahoo Finance timeseries history for 2026 stock
#' monthly close prices adjusted for splits and not for dividends.
#' Covering the timespan from January 2018 to December 2023.
#' Column names of this dataset correspond to Yahoo Finance tickers
#' and the `Ticker`column in the `company_database` dataset.
#'
#' @format An xts object with 71 rows from 2018-01-31 to 2023/11/30 and 2026 columns:
#' \describe{
#'   \item{ABCA.PA}{ABC Arbitrage monthly close prices}
#'   \item{...}{...}
#'   \item{<Ticker>}{<Company_name> monthly close prices}
#'   \item{...}{...}
#'   \item{WMT}{Walmart monthly close prices}
#'}
#' @source <https://finance.yahoo.com/quote/.../history>
"company_timeseries"

#' Historical FOREX bid prices - monthly close of EURUSD (from Yahoo Finance)
#'
#' A subset of Yahoo Finance timeseries history for EURUSD (`EURUSD=X`)#'
#' covering the timespan from January 2018 to December 2023.
#' Columns names of this dataset DO NOT correspond to Yahoo Finance tickers
#' and ARE NOT available in the `company_database` dataset.
#'
#' @format An xts object with 71 rows from 2018-01-31 to 2023/11/30 and 2 coumns:
#' \describe{
#'   \item{EURUSD}{EUR/USD bid FX spot rate}
#' }
#' @source <https://finance.yahoo.com/quote/.../history>
"forex_timeseries"
