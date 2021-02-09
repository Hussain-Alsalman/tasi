#' Historical Data of a specified company for a specified period.
#'
#' @param startDate The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param endDate The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param companySymbol Company Symbol number
#'
#' @return
#' @export
#'
#' @examples
#' #This will extract the historical stock records for ARAMCO for full year 2020
#' getCompanyRecords("2020-01-01", "2020-12-31", 2222)
#'
getCompanyRecords <- function (startDate, endDate, companySymbol){
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

  return (fullData[nRecords:1,])
}
