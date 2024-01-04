# This is an undecorated, unexported function, which enables handling failed downloads
internalGS <- function(symbol, from, to) {
  data <- NULL
  tryCatch(
    {
      data <- suppressWarnings(getSymbols(Symbols = symbol, from = from, to = to, periodicity = "monthly", auto.assign = FALSE))
    },
    error = function(cond) {
      NULL
    },
    finally = {
      return(data)
    }
  )
}
