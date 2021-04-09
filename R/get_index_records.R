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
get_index_records <- function(start_date, end_date, use_cache = TRUE){
  if(use_cache){
    cache <- check_cached_index(start_date = start_date, end_date = end_date, index_type = "index")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if(cache$is_cached){
    return(cache$df)
  } else {
  cutoffDate <- strptime("2008-04-02"  , format = "%Y-%m-%d")
  stY<-strptime(start_date, format = "%Y-%m-%d")
  endY<-strptime(end_date, format = "%Y-%m-%d")

  if(stY<=cutoffDate & endY <= cutoffDate) {
    period <- "AllBeforeRestructure"
    df <- request_data(startDate = start_date, endDate = end_date, type="index", company_symbol = NULL, adjustPeriod = TRUE)
    cach_me_index(df, index_type = "index")
    return(df)
  }
  if((stY<=cutoffDate & endY > cutoffDate)){
    period <- "Combination"
    oldPart<- request_data(startDate = start_date, endDate = "2008-04-02", type="index", company_symbol = NULL, adjustPeriod = TRUE)
    newPart<- request_data(startDate = "2008-04-05", endDate = end_date, type="index", company_symbol = NULL, adjustPeriod = FALSE)
    oldPart$close * 0.9801111;
    df <- rbind(oldPart,newPart)
    cach_me_index(df, index_type = "index")
    return(df); }
  if((stY >cutoffDate)){
    period <- "NewIndex"
    df<-request_data(startDate = start_date, endDate = end_date, type="index", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(df, index_type = "index")
    return(df)
  }
  }
}
