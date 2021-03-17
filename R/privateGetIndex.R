#' privateGetIndex
#'
#' @param startDate The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param endDate The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param adjustPeriod This is logical term. If TRUE prices based on prior to adjustment.
#'
#' @return : data frame of the TASI index
privateGetIndex <-function(startDate, endDate, adjustPeriod){
  nRecords <-  rjson::fromJSON(file= parseURL(0, startDate, endDate, type = "index", adjustment = adjustPeriod))$recordsFiltered
  ifelse(nRecords <= 10, nPages <- 1, nPages <- ceiling(nRecords/10))

  fullData <- data.frame(stringsAsFactors = FALSE)

  for (i in 0:nPages ) {
    jsonData <- rjson::fromJSON(file = parseURL((i*10), startDate, endDate, type = "index", adjustment = adjustPeriod))
    p.table <- t(sapply(jsonData$data, function(x) unlist(x)))
    fullData <- rbind(fullData, as.data.frame(p.table, stringsAsFactors = FALSE))
  }
  #Formatting the table

  fullData$date <- strptime(fullData$date, format = "%Y/%m/%d")
  fullData$high <- num_format(fullData$high)
  fullData$open <- num_format(fullData$open)
  fullData$low <- num_format(fullData$low)
  fullData$close <- num_format(fullData$close)
  fullData$noOfTrades <- num_format(fullData$noOfTrades)
  fullData$totalVolume <- num_format(fullData$totalVolume)
  return (fullData[order(as.Date(fullData$date)),])
}
