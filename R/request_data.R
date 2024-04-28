# nolint start: line_length_linter, object_name_linter.
#' Data Crawler
#'
#' @param startDate The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param endDate The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param adjustPeriod This is logical term. If TRUE prices based on prior to adjustment.
#'
#' @return : data frame of the TASI index
request_data <- function(startDate, endDate, type, company_symbol = NULL, adjustPeriod = FALSE) {
  setup_caching_folders()
  validate_input(startDate, endDate, company_symbol)
  startDate = legacy_date(startDate)
  endDate = legacy_date(endDate)

  period <- difftime(as.Date(endDate, tryFormats = c("%m/%d/%Y")),as.Date(startDate, tryFormats = c("%m/%d/%Y")), units = "days")
  period = as.integer(period)
  inx <- seq(from = 1, to = period, by = 100)
  fullData <- data.frame(stringsAsFactors = FALSE)
  if (length(inx) <= 2) {
    jsonData <- rjson::fromJSON(
      file = parseURL(
        startDate = startDate,
        endDate = endDate,
        comp_symbol = company_symbol,
        startIndex = 1,
        endIndex = 26,
        type = type,
        adjusted = adjustPeriod)
      )
    p.table <- t(sapply(jsonData$data, function(x) unlist(x)))
    fullData <- rbind(fullData, as.data.frame(p.table, stringsAsFactors = FALSE))
    } else {
      pb <- progress::progress_bar$new(total = length(inx) - 1, format = "Extracting Data [:bar] :percent : eta: [:eta]")
        for (i in 1:(length(inx) - 1)) {
          jsonData <- rjson::fromJSON(
            file = parseURL(
              startDate = startDate,
              endDate = endDate,
              comp_symbol = company_symbol,
              startIndex = inx[i],
              endIndex = inx[i + 1],
              type = type,
              adjusted = adjustPeriod)
          )
          p.table <- t(sapply(jsonData$data, function(x) unlist(x)))
          fullData <- rbind(fullData, as.data.frame(p.table, stringsAsFactors = FALSE))
          pb$tick()
        }
    }
  fullData <- format_df(fullData, type = type)
  return(fullData)
}
# nolint end
