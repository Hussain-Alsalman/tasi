# nolint start: line_length_linter, object_name_linter.
#' TASI Index records
#' get all records of TASI for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the TASI index
#' @export
#'
#' @examples
#' get_index_records("2020-01-01", "2020-12-31")
#'
get_index_records <- function(start_date, end_date, use_cache = TRUE) {

  validate_input(start_date, end_date)

  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date, index_type = "index")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    df <- request_data(startDate = start_date, endDate = end_date,type = "index",company_symbol = NULL)
    return(df)
  }
}
# nolint end
