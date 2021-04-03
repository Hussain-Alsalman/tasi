#' Historical Data of a specified company for a specified period.
#'
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param company_symbol Company Symbol number
#' @param use_cache logical operator for using cached data
#'
#' @return returns a data frame of company historical stock performance
#' @export
#'
#' @examples
#' #This will extract the historical stock records for ARAMCO for full year 2020
#' ## Not run:
#' get_company_records("2020-01-01", "2020-12-31", 2222)
#' ## End(Not run)
get_company_records <- function (start_date, end_date, company_symbol, use_cache = TRUE){
  if(use_cache){
    cache <- check_cached_company(start_date = start_date, end_date = end_date,  symbol=company_symbol)
  } else {
    cache <- list(is_cached = FALSE)
  }
  if(cache$is_cached){
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "company", company_symbol = company_symbol, adjustPeriod = FALSE)

  #Formatting the table
  fullData<- format_df(fullData, type = "company")
  cach_me_com(fullData,company_symbol)
  return (fullData)
  }
}
