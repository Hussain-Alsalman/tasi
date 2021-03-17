#' Historical Data of a specified company for a specified period.
#'
#' @param startDate The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param endDate The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param companySymbol Company Symbol number
#' @param use_cache logical operator for using cached data
#'
#' @return returns a data frame of company historical stock performance
#' @export
#'
#' @examples
#' #This will extract the historical stock records for ARAMCO for full year 2020
#' ## Not run:
#' getCompanyRecords("2020-01-01", "2020-12-31", 2222)
#' ## End(Not run)
getCompanyRecords <- function (startDate, endDate, companySymbol, use_cache = TRUE){
  if(use_cache){
    cache <- check_cached_company(start_date = startDate, end_date = endDate,  symbol=companySymbol)
  } else {
    cache <- list(is_cached = FALSE)
  }
  if(cache$is_cached){
    return(cache$df)
  } else {
  nRecords <-  rjson::fromJSON(file= parseURL(0, startDate, endDate, companySymbol, type = "company"))$recordsFiltered
  ifelse(nRecords <= 30, nPages <- 1, nPages <- ceiling(nRecords/30))
  fullData <- data.frame(stringsAsFactors = FALSE)
  for (i in 0:nPages ) {
    jsonData <- rjson::fromJSON(file = parseURL((i*30), startDate, endDate, companySymbol, type = "company"))
    p.table <- t(sapply(jsonData$data, function(x) unlist(x)))
    fullData <- rbind(fullData, as.data.frame(p.table, stringsAsFactors = FALSE))
  }

  #Formatting the table
  fullData$transactionDate <- strptime(fullData$transactionDate, format = "%b %e, %Y")
  fullData$previousClosePrice <- as.numeric(fullData$previousClosePrice)
  fullData$todaysOpen <- as.numeric(fullData$todaysOpen)
  fullData$highPrice <- as.numeric(fullData$highPrice)
  fullData$lowPrice <- as.numeric(fullData$lowPrice)
  fullData$volumeTraded <- as.numeric(fullData$volumeTraded)
  fullData$turnOver <- as.numeric(fullData$turnOver)
  fullData$noOfTrades <- as.numeric(fullData$noOfTrades)
  fullData$lastTradePrice <- as.numeric(fullData$lastTradePrice)
  fullData$change <- as.numeric(fullData$change)
  fullData$changePercent <- as.numeric(fullData$changePercent)
  cach_me_com(fullData[order(as.Date(fullData$transactionDate)),],companySymbol)
  return (fullData[order(as.Date(fullData$transactionDate)),])
  }
}
