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
get_company_records <- function(start_date, end_date, company_symbol, use_cache = TRUE){
  if(use_cache){
    cache <- check_cached_company(start_date = start_date, end_date = end_date,  symbol=company_symbol)
  } else {
    cache <- list(is_cached = FALSE)
  }
  if(cache$is_cached){
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "company", company_symbol = company_symbol, adjustPeriod = FALSE)
    cach_me_com(fullData,company_symbol)
    return (fullData)
  }
}



#' Historical Data of a group of companies for specific period.
#'
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param symbol_vector vector of company symbol numbers
#' @param use_cache logical operator for using cached data
#'
#' @return returns a data frame of company historical stock performance
#' @export
#'
#' @examples
#' #This will extract the historical stock records for ARAMCO for full year 2020
#' ## Not run:
#' getSymbols("2020-01-01", "2020-12-31", c(2222, 2050))
#' ## End(Not run)
#'
#'
getSymbols <- function(start_date, end_date, symbol_vector, use_cache = TRUE){
  for (symbol in symbol_vector) {
    df <- get_company_records(start_date,end_date,symbol,use_cache = TRUE)
    df <- add_adj_price(df,symbol = symbol)
    df_colnames <- colnames(df)
    new_colnames <- paste0("T",symbol,".",df_colnames)
    colnames(df) <- new_colnames
    df <- xts::convertIndex(x=df, value = "POSIXct")
    assign(paste0("T",symbol), df, envir = parent.frame())
  }
}
