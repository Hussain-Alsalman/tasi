# nolint start: line_length_linter, object_name_linter.

#' List all available industries
#'
#' @return returns a character vector containing all industries names
#' @details This function is to be used in conjunction with `industry_func(industry)` function.
#' @export
#'
#' @examples
#' get_banks <- industry_func(list_industries()[14])
#' # now we have a function called get_banks()
list_industries <- function() {
  names(constants[8:28])
}


#' Industry Function Factory
#'
#' @param industry a character scaler with industry defined names. Can be obtained from `list_industries()`
#' @details  This is a function factory where you can create your own function to get the historical data of any industry.
#' it has the following parameters.
#' start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' use_cache logical operator for using cached data
#'
#'
#' @return returns a function that can be used to obtain historical records of specific industry
#' @export
#'
#' @examples
#'get_banks <- industry_func("banks")
#'
#'
industry_func <- function(industry) {

   function(start_date, end_date, use_cache = TRUE) {
    validate_input(start_date, end_date)
    if (use_cache) {
      cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = industry)
    } else {
      cache <- list(is_cached = FALSE)
    }
    if (cache$is_cached) {
      return(cache$df)
    } else {
      fullData <- request_data(startDate = start_date, endDate = end_date, type = industry, company_symbol = NULL, adjustPeriod = FALSE)
      cach_me_index(fullData, index_type = industry)
      return(fullData)
    }
  }
}

# nolint end
