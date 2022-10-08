# nolint start: line_length_linter, object_name_linter.
#' Data Crawler
#'
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param adjustPeriod This is logical term. If TRUE prices based on prior to adjustment.
#'
#' @return : data frame of the TASI index
request_data <- function(startDate, endDate, type, company_symbol = NULL, adjustPeriod = FALSE) {
  setup_caching_folders()
  record_limit <- ifelse(type == "company", 30, 10)
  nRecords <-  rjson::fromJSON(file = parseURL(0, startDate, endDate, type = type, comSymbol = company_symbol, adjustment = adjustPeriod))$recordsFiltered
  ifelse(nRecords <= record_limit, nPages <- 1, nPages <- ceiling(nRecords / record_limit))
  fullData <- data.frame(stringsAsFactors = FALSE)

  for (i in 0:nPages) {
    jsonData <- rjson::fromJSON(file = parseURL((i * record_limit), startDate, endDate, type = type, comSymbol = company_symbol, adjustment = adjustPeriod))
    p.table <- t(sapply(jsonData$data, function(x) unlist(x)))
    fullData <- rbind(fullData, as.data.frame(p.table, stringsAsFactors = FALSE))
  }
  fullData <- format_df(fullData, type = type)
  return(fullData)
}
# nolint end
