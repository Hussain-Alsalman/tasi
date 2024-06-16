# nolint start: line_length_linter, object_name_linter.

#' Validating input function
#'
#' @param start_date Date to be validated.
#' @param end_date Date to be validated.
#' @param company_symbol Company Symbol to be validated. This is omitted by Default.
#'
#' @return This Function returns error message if any of the checks failed.
#'
validate_input <- function(start_date, end_date, company_symbol = NULL) {

  for (date_str in list(start_date, end_date)) {
    if (!assertthat::is.string(date_str)) {
      stop("Date provided is not a string. Please provide date as string in 'yyyy-mm-dd' format")
      }
    if (!grepl(pattern = "[1-2][0-9]{3}-[0-1][0-9]-[0-9]{2}", x = date_str)) {
      stop("Date provided is in incorrect format. Please provide date in 'yyyy-mm-dd' format. for example '2020-02-01', '2021-12-23'")
    }
  }
  if (!is.null(company_symbol)) {
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
  str_date <- date_elements(leg_date)
  return(paste(str_date$M, str_date$D, str_date$Y, sep = "/"))
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
#'
num_format <- function(num) {
    as.numeric(gsub(pattern = ",", replacement = "", x = num))
}

#' Converting Data Frame to xts
#'
#' @param x Data Frame to be converted to xts object
#'
#' @return returns an xts object
#' @export
#'
#' @examples
#' df <- get_company_records("2020-01-01", "2020-12-31", 2222)
#' df_to_xts(df)
df_to_xts <- function(x) {
  x <- x[,c("transactionDate",
       "todaysOpen",
       "highPrice",
       "lowPrice",
       ifelse(!"lastTradePrice" %in% colnames(x), "previousClosePrice", "lastTradePrice"),
       "volumeTraded")]
  colnames(x)  <- c("Date","Open", "High", "Low","Close", "Volume")
  x <- xts::as.xts(x = x[, c("High", "Open", "Low", "Close", "Volume")], order.by = x$Date)
  x <- xts::convertIndex(x = x, value = "POSIXct")
  return(x)
  }

#' Title
#'
#' @param df unformatted data frame
#' @param type specify type of data frame provided for formatting
#'
#' @return formatted data frame
#'
format_df <- function(df, type = "index") {
  df$previousClosePrice <- num_format(df$previousClosePrice)
  df$todaysOpen <- num_format(df$todaysOpen)
  df$highPrice <- num_format(df$highPrice)
  df$lowPrice <- num_format(df$lowPrice)
  df$volumeTraded <- num_format(df$volumeTraded)
  df$turnOver <- num_format(df$turnOver)
  df$noOfTrades <- num_format(df$noOfTrades)

  if (type == "company") {
    df$transactionDate <- strptime(df$transactionDate, format = "%b %e, %Y")
    df$lastTradePrice <- num_format(df$lastTradePrice)
    df$change <- as.numeric(gsub(pattern = "<.*?>",replacement = "", x = df$change))
    df$changePercent <- as.numeric(gsub(pattern = "<.*?>",replacement = "", x = df$changePercent))
  }
  if (!"lastTradePrice" %in% colnames(df)) {
    df$transactionDate <- strptime(df$transactionDate, format = "%Y/%m/%d")
    df <- df[,c(1,4:7,2:3,8:9)]
    }
    return(df[order(as.Date(df$transactionDate)), ] |> unique())
  }

#' Add adjusted prices to dividens to an xts object
#'
#' @param x xts object (data frames will be converted to xts)
#' @param symbol the symbol of the company
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @return xts object with adjusted prices
#' @export
#'
#' @import magrittr
#' @examples
#' start_d <- "2022-01-01"
#' end_d <- "2023-01-01"
#' symbol <- 2222
#' get_company_records(start_date = start_d, end_date = end_d, company_symbol = symbol) |>
#' df_to_xts() |>
#' add_adj_price(symbol = symbol, start_date = start_d, end_date = end_d)
#'
add_adj_price <- function(x, symbol, start_date, end_date) {
  str_s <- date_elements(start_date)
  str_e <- date_elements(end_date)

  start_date <- paste(str_s$D,"-",str_s$M,"-", str_s$Y, sep = "")
  end_date <- paste(str_e$D,"-",str_e$M,"-", str_e$Y, sep = "")
  req <-  httr::POST(paste0(constants$dividends_base_url,constants$dividends_unique_key,constants$dividens), body = list(
   symbolorcompany = symbol,
   start = start_date,
   end = end_date,
   marketsListId = "M",
   sector = "",
   period = "CUSTOM",
   bySymbol = symbol,
   market = ""
   ),
  encode = "form")
  df <- httr::content(req,type = "application/json")
  df <- purrr::map(df$data, function(x) as.data.frame(t(unlist(x)))) |>
      purrr::list_rbind()
  if (!xts::is.xts(x)) x <- df_to_xts(x)

  if (length(inx_na <- which(is.na(df$distributionDate))) > 0 ) {
    df$distributionDate[inx_na] <- df$announcedDate[inx_na]
  }
  divdns_xts <- xts::as.xts(as.numeric(df$amountValue), order.by = strptime(df$distributionDate, format = "%Y-%m-%d"))
  if (length(divdns_xts) > 0) {
    x$Adjusted <- quantmod::Cl(x) * TTR::adjRatios(close = quantmod::Cl(x),  dividends = divdns_xts)$Div
  } else {
    x$Adjusted <- x$Close
  }
  return(x)
}

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
  first_inx <- which(names(constants) == "msci30")
  last_inx <- which(names(constants) == "real_estate")
  names(constants[first_inx:last_inx])
}

#' Get company info in a list
#'
#' @param comp_symbol  Company Symbol.
#'
#' @return list with named elements for including all company info including its industry peers.
#' @export
#'
#' @examples
#' comp_info(2010)
comp_info <- function(comp_symbol) {
  stock_indices <- get("stock_indices")
  id <- as.character(comp_symbol)
  info <- as.list(
    stock_indices[which(stock_indices$companySymbol == id),]
    )
  info$peers <- stock_indices$companySymbol[which(stock_indices$sectorName == info$sectorName &
                                                    stock_indices$companySymbol != id)]
  return(info)
}

# nolint end
