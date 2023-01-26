# nolint start: line_length_linter, object_name_linter.

#' Parsing URL call
#' This function construct the URL string used to request data from TADAWUL website.
#'
#' @param startDate The start date of the query. Date is a string that needs to be in mm/dd/yyy format
#' @param endDate The end date of the query. Date is a string that needs to be in mm/dd/yyy format
#' @param comp_symbol Company Symbol number
#' @param startIndex start of data indexing
#' @param endIndex end of data indexing
#' @param type Type of URL cal. Choices are "company" or "index"
#' @param adjusted adjustment string variable. Options are "yes or "no"
#'
#' @return
#' @export
#'
#' @examples
parseURL <- function(startDate, endDate, comp_symbol, startIndex, endIndex, type, adjusted = FALSE) {
  if (type == "company") {
    return(
      paste(constants$comp,
            comp_symbol,
            "&startDate=",startDate,
            "&endDate=", endDate,
            "tableTabId=",ifelse(adjusted,0,1),
            "&startIndex=",startIndex,
            "&endIndex=",endIndex, sep = "")
    )
  }
  if (type == "index") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return(
      paste(
        constants$mrk, p, "&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y, "%2F", from_date$M, "%2F", from_date$D, "+-+", to_date$Y, "%2F", to_date$M, "%2F", to_date$D, "&typeOfCall=",
        ifelse(adjustment, "nonAdjustedType&old_tasi_current_sector=TASI", "adjustedType"), sep = ""
      )
    )
  }
  if (type != "company" && type != "index") {
    industry_parser(p, from_date = fromDate, to_date = toDate, industry = type)
  }
}


#' Parsing URL call for Financial Statements
#' This function construct the URL string used to request data from TADAWUL website specifically for Financial Statements.
#'
#' @param comSymbol Company Symbol number
#' @param statement_type Type of Financial Statement. This can be one of these choices "balance_sheet", "income_statement", "cash_flow", "xbrl"
#' @param period Type of period. This can be either "yearly" or "quarterly"
#'
#' @return string of values
#'
#'
fin_parsURL <- function(comSymbol = NULL, statement_type, period) {
  if (statement_type == "xbrl") {
    paste0(
      constants$fin_statement$url,
      constants$fin_statement$statement_type[statement_type],
      constants$fin_statement$period[period], "&symbol=", comSymbol)
  } else {
  paste0(
    constants$fin_statement$url,
    constants$fin_statement$statement_type[statement_type],
    constants$fin_statement$period[period], "&symbol=", comSymbol)
    }
}

profile_parse_url  <- function(com_symbol = NULL) {

}
# nolint end

