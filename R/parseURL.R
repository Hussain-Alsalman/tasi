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
#' @return parsed url link for data
#'
parseURL <- function(startDate, endDate, comp_symbol, startIndex, endIndex, type, adjusted = FALSE) {
  prams <- list()

  if (type == "company") {
    prams$market <- "MAIN"
    prams$sector <- "0"
    prams$entity <- comp_symbol
  } else if ( type == "index") {
    prams$market <- "INDICES"
    prams$sector <- "M"
    prams$entity <- "M:TASI"
  } else {
    prams$market <- "INDICES"
    prams$sector <- "M"
    prams$entity <- paste("M:",constants[type], sep = "")
  }
    return(

      paste(constants$records_base_url,
            constants$records_unique_key,
            constants$records,
            "&start=", startIndex,
            "&selectedMarket=",prams$market,
            "&selectedSector=",prams$sector,
            "&selectedEntity=",prams$entity,
            "&startDate=",startDate,
            "&endDate=", endDate,
            "tableTabId=",ifelse(adjusted,0,1),
            "&startIndex=",startIndex,
            "&endIndex=",endIndex, sep = "")
      )
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
fin_parsURL <- function(comSymbol = NULL, statement_type) {
  if (statement_type == "xbrl") {
    paste0(
      constants$fin_statement$url,
      constants$fin_statement$statement_type[statement_type],
      "&symbol=", comSymbol)
  } else {
  paste0(
    constants$fin_statement$url,"?",
    constants$fin_statement$statement_type[statement_type],
    "&symbol=", comSymbol)
    }
}

# nolint end

