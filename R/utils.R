#' Date element extractor
#'
#' @param date_str Date is a string that needs to be in yyyy-mm-dd format
#'
#' @return list containing date elements and full date string.
#'
date_elements <- function(date_str) {
  date_str <- strptime(date_str, format = "%Y-%m-%d")
  return (list(
    Y = format.Date(date_str, "%Y"),
    M = format.Date(date_str, "%m"),
    D = format.Date(date_str, "%d"),
    date_str = date_str
  ))
}

#' Converting strings to cleaned up numeric values
#'
#' @param num string number
#'
#' @return clean numeric value
#'
#' @examples
#' tasi:::num_format("200,000")
#'
num_format <- function(num) {
  as.numeric(gsub(",","", num))
}


#' Converting Data Frame to xts
#'
#' @param x Data Frame to be converted to xts object
#'
#' @return
#' returns an xts object
#' @export
#'
#' @examples
#' df <- getCompanyRecords("2020-01-01", "2020-12-31", 2222)
#' df_to_xts(df)
df_to_xts <- function(x) {
  colnames(x)[c(1,4:7,12)] <- c("Date", "Open", "High", "Low","Volume", "Close")
  x <-xts::as.xts(x = x[,c("Open", "High", "Low","Volume", "Close")],order.by =x$Date )
  return(x)
  }
