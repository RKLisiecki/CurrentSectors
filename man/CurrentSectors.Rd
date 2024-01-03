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

\strong{Included functions:}

\code{printSectorStructure()}

 - prints the nested structure of sectors and industries


\code{listCompanies(country, sector=NULL, industry=NULL, market_cap_thresh = NULL)}

 - produces a dataframe of companies from a given country and sector or industry


\code{saveData(path)}

 - saves library datasets as Rda files in an existing users's directory


\code{updateData(path)}

 - updates the library's datasets, which were saved in user's directory on disk


\code{sStructure(country, path=NULL)}

 - calculate shares of each sector's market cap. in total market cap.


\code{sStructureChart(country, path=NULL)}

 - plots a pie-chart of sector market cap shares for companies in a given country


\code{sIndices(country=NULL, path=NULL)}

 - calculates aggregate sector market capitalization time series


\code{sIndicesChart(country=NULL, path=NULL)}

 - plots aggregate sector market capitalization time series


\code{sIndicesTRCompChart(country1, country2, sector1, sector2, path=NULL)}

 - plots sector total returns comparison time series for two sectors


\code{TAReport(country, sector, path=NULL)}

 - calculates a technical analysis report


\strong{Included datasets:}

\code{company_database}

 - company overviews for 2025 European and American stocks


\code{company_timeseries}

 - historical monthly stock prices of the above stocks


\code{forex_timeseries}

 - historical monthly bid prices of EURUSD
}
\author{
R. Karol Lisiecki
}
