#' Parsing URL call
#' This function construct the URL string used to request data from TADAWUL website.
#'
#' @param p pagination numeric variable
#' @param fromDate The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param toDate The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param comSymbol Company Symbol number
#' @param type Type of URL cal. Choices are "company" or "index"
#' @param adjustment adjustment string variable. Options are "yes or "no"
#'
#' @return parsed URL string
parseURL <- function(p,fromDate, toDate, comSymbol = NULL , type, adjustment ="no") {
  if (type == "company") {
    return (
      paste(
        constants$comp,p,"&length=30&search%5Bvalue%5D=&search%5Bregex%5D=false&isNonAdjusted=0&startDate=", fromDate, "&toDate=" ,toDate,"&symbol=",comSymbol,"&_=1548771264757",sep = ""
      )
    )
  }
  if (type == "index") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$mrk,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", ifelse(adjustment =="no",  "adjustedType","nonAdjustedType&old_tasi_current_sector=TASI"),sep = ""
      )
    )
  }

}
