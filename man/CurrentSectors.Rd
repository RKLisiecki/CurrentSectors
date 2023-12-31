\name{CurrentSectors}
\alias{CurrentSectors}

\title{
Stock Quotes Analysis Across Sectors and Regions
}
\description{
R package containing datasets and functions to support
stock quotes analysis across sectors, industries and regions.
}
\details{
The CurrentSectors package for R Empowers drilling down stock quotes across sectors and countries, facilitates comparative analysis of stock market performance across sectors and countries, streamlines sector structure analysis and sector performance analysis, simplifies bulk data ingestion from Yahoo Finance.

\emph{Included functions}

printSectorStructure()
 - prints the nested structure of sectors and industries


listCompanies()
 - produces a dataframe of companies from a given country and sector or industry

saveData()
 - saves library datasets as Rda files in an existing users's directory

sIndices()
 - calculates aggregate sector market capitalization time series

\emph{Included datasets}

company_database
 - company overviews for 2104 European and American stocks

company_timeseries
 - historical monthly stock prices of the above stocks

forex_timeseries
 - historical monthly bid prices of EURUSD and EURNOK

}
\author{
R. Karol Lisiecki

}
\keyword {package}
