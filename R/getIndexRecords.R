#' TASI Index records
#' get all records of TASI for a specified period.
#' @param fromDate The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param toDate The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#'
#' @return Data frame of the TASI index
#' @export
#'
#' @examples
#' getIndexRecords("2020-01-01", "2020-12-31")
#'
getIndexRecords <- function(fromDate, toDate){

  cutoffDate <- strptime("2008-04-02"  , format = "%Y-%m-%d")
  stY<-strptime(fromDate, format = "%Y-%m-%d")
  endY<-strptime(toDate, format = "%Y-%m-%d")

  if(stY<=cutoffDate & endY <= cutoffDate) {
    period <- "AllBeforeRestructure"
    return(privateGetIndex(startDate = fromDate, endDate = toDate, adjustPeriod = "yes"))
  }
  if((stY<=cutoffDate & endY > cutoffDate)){
    period <- "Combination"
    oldPart<- privateGetIndex(startDate = fromDate, endDate = "2008-04-02", adjustPeriod = "yes")
    newPart<- privateGetIndex(startDate = "2008-04-05", endDate = toDate, adjustPeriod = "no")
    oldPart$close * 0.9801111;
    return(rbind(oldPart,newPart)); }
  if((stY >cutoffDate)){
    period <- "NewIndex"
    return(privateGetIndex(startDate = fromDate, endDate = toDate, adjustPeriod = "no"))
  }
}
