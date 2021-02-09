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
