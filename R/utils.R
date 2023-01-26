# nolint start: line_length_linter, object_name_linter.

#' Validating input function
#'
#' @param start_date Date to be validated.
#' @param end_date Date to be validated.
#' @param company_symbol Company Symbol to be validated. This is omitted by Default.
#'
#' @return This Function returns error message if any of the checks failed.
#'
validate_input <- function(start_date, end_date, company_symbol = "omit") {

  for (date_str in list(start_date, end_date)) {
    if (!assertthat::is.string(date_str)) {
      stop("Date provided is not a string. Please provide date as string in 'yyyy-mm-dd' format")
      }
    if (!grepl(pattern = "[1-2][0-9]{3}-[0-1][0-9]-[0-9]{2}", x = date_str)) {
      stop("Date provided is in incorrect format. Please provide date in 'yyyy-mm-dd' format. for example '2020-02-01', '2021-12-23'")
    }
  }

  if (company_symbol != "omit") {
    if (!assertthat::is.number(company_symbol) || !grepl(pattern = "[1-9][0-9]{3}", x = company_symbol)) {
      stop("Company Symbol provided is incorrect. Company Symbols are usually 4 digit number with non-leading zero. for example 2222, 2010")
    }
  }
}

#' Converting legacy date format into the new format
#'
#' @param leg_date string in date format 'yyyy-mm-dd'
#'
#' @return string in date format 'mm/dd/yyyy'

legacy_date <- function(leg_date) {
  y <- substr(leg_date, 1,4)
  m <- substr(leg_date, 6,7)
  d <- substr(leg_date, 9,10)
  return(paste(m,d,y,sep = "/"))
}

#' Date element extractor
#'
#' @param date_str Date is a string that needs to be in yyyy-mm-dd format
#'
#' @return list containing date elements and full date string.
#'
date_elements <- function(date_str) {
  validate_input(start_date = date_str, as.character(Sys.Date()))
  date_str <- strptime(date_str, format = "%Y-%m-%d")
  return(list(
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
  stringr::str_extract_all(pattern = "(^-)?[0-9]", string = num, simplify = TRUE) %>%
    paste0(collapse = "") %>%
    as.numeric()
}


#' Converting Data Frame to xts
#'
#' @param x Data Frame to be converted to xts object
#'
#' @return
#' returns an xts object
#' @export
#'
#' @examples
#' df <- get_company_records("2020-01-01", "2020-12-31", 2222)
#' df_to_xts(df)
df_to_xts <- function(x) {
  if (all(c("transactionDate", "highPrice", "todaysOpen", "lowPrice",  "lastTradePrice", "volumeTraded", "turnOver", "noOfTrades") %in% colnames(x))) {
    colnames(x)[c(1:4,6,11)] <-  c("Date","Open", "High", "Low", "Volume","Close")
    x <- xts::as.xts(x = x[, c("High", "Open", "Low", "Close", "Volume")], order.by = x$Date)
    x <- xts::convertIndex(x = x, value = "POSIXct")
    return(x)
  }else {
  colnames(x)[c(1, 4:7, 12)] <- c("Date", "Open", "High", "Low", "Volume", "Close")
  x <- xts::as.xts(x = x[, c("Open", "High", "Low", "Volume", "Close")], order.by = x$Date)
  x <- xts::convertIndex(x = x, value = "POSIXct")
  return(x)
  }
}

#' Title
#'
#' @param df unformatted data frame
#' @param type specify type of data frame provided for formatting
#'
#' @return formatted data frame
#'
format_df <- function(df, type = "index") {
  if (type == "company") {
    df$transactionDate <- strptime(df$transactionDateStr, format = "%Y-%m-%d")
    df$previousClosePrice <- as.numeric(df$previousClosePrice)
    df$todaysOpen <- as.numeric(df$todaysOpen)
    df$highPrice <- as.numeric(df$highPrice)
    df$lowPrice <- as.numeric(df$lowPrice)
    df$volumeTraded <- as.numeric(gsub(pattern = ",", replacement = "", x = df$volumeTraded))
    df$turnOver <- as.numeric(gsub(pattern = ",", replacement = "", x = df$turnOver))
    df$noOfTrades <- as.numeric(gsub(pattern = ",", replacement = "", x = df$noOfTrades))
    df$lastTradePrice <- as.numeric(df$lastTradePrice)
    df$change <- as.numeric(gsub(pattern = "<.*?>",replacement = "", x = df$change))
    df$changePercent <- as.numeric(gsub(pattern = "<.*?>",replacement = "", x = df$changePercent))
    return(df[order(as.Date(df$transactionDate)), ])
  } else if (type == "msci") {
    df$date <- strptime(df$date, format = "%Y/%m/%d")
    df$high <- num_format(df$high)
    df$open <- num_format(df$open)
    df$low <- num_format(df$low)
    df$close <- num_format(df$close)
    df$noOfTrades <- 0
    df$totalVolume <- 0
    return(df[order(as.Date(df$date)), ])
  } else {
    df$date <- strptime(df$date, format = "%Y/%m/%d")
    df$high <- num_format(df$high)
    df$open <- num_format(df$open)
    df$low <- num_format(df$low)
    df$close <- num_format(df$close)
    df$noOfTrades <- num_format(df$noOfTrades)
    df$totalTurnover <- num_format(df$totalTurnover)
    df$totalVolume <- num_format(df$totalVolume)
    return(df[order(as.Date(df$date)), ])
  }
  }

#' Add adjusted prices to dividens to an xts object
#'
#' @param x xts object (data frames will be converted to xts)
#' @param symbol the symbol of the company
#'
#' @return xts object with adjusted prices
#' @export
#'
#'
#' @import magrittr
add_adj_price <- function(x, symbol, start_date, end_date) {
  req <-  httr::POST(constants$dividens, body = list(
   symbolorcompany = symbol,
   start = start_date,
   end = end_date,
   marketsListId = "M",
   sector = "",
   period = "CUSTOM"
   ),
  encode = "form")
  df <- httr::content(req,type = "application/json")
  df <- t(sapply(df$data, function(x) unlist(x)))
  df <- as.data.frame(df)
  if (!xts::is.xts(x)) x <- df_to_xts(x)

  divdns_xts <- xts::as.xts(as.numeric(df$amountValue), order.by = strptime(df$distributionDate, format = "%Y-%m-%d"))
  if (length(divdns_xts) > 0) {
    x$Adjusted <- quantmod::Cl(x) * TTR::adjRatios(close = quantmod::Cl(x),  dividends = divdns_xts)$Div
  } else {
    x$Adjusted <- x$Close
  }
  return(x)
  }

industry_parser <- function(p, from_date, to_date, industry) {
    from_date <- date_elements(from_date)
    to_date <- date_elements(to_date)
    return(
      paste(
        constants[industry], p, "&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y, "%2F", from_date$M, "%2F", from_date$D, "+-+", to_date$Y, "%2F", to_date$M, "%2F", to_date$D, "&typeOfCall=", "adjustedType", sep = ""
      )
    )
}

# nolint end
