#' Date element extractor
#'
#' @param date_str Date is a string that needs to be in yyyy-mm-dd format
#'
#' @return list containing date elements and full date string.
#'
date_elements <- function(date_str) {
  date_str <- strptime(date_str, format = "%Y-%m-%d")
  return (list(
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
  as.numeric(gsub(",","", num))
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
#' df <- getCompanyRecords("2020-01-01", "2020-12-31", 2222)
#' df_to_xts(df)
df_to_xts <- function(x) {
  if (all(c("date", "high", "open", "low" ,  "close", "totalVolume", "totalTurnover" ,"noOfTrades") %in% colnames(x))) {
    colnames(x)[1:6] <-  c("Date", "High", "Open", "Low","Close", "Volume")
    x <- xts::as.xts(x = x[,c("High", "Open", "Low","Close", "Volume")], order.by = x$Date)

    return(x)
  }else {
  colnames(x)[c(1,4:7,12)] <- c("Date", "Open", "High", "Low","Volume", "Close")
  x <-xts::as.xts(x = x[,c("Open", "High", "Low","Volume", "Close")],order.by =x$Date )
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
    df$transactionDate <- strptime(df$transactionDate, format = "%b %e, %Y")
    df$previousClosePrice <- as.numeric(df$previousClosePrice)
    df$todaysOpen <- as.numeric(df$todaysOpen)
    df$highPrice <- as.numeric(df$highPrice)
    df$lowPrice <- as.numeric(df$lowPrice)
    df$volumeTraded <- as.numeric(df$volumeTraded)
    df$turnOver <- as.numeric(df$turnOver)
    df$noOfTrades <- as.numeric(df$noOfTrades)
    df$lastTradePrice <- as.numeric(df$lastTradePrice)
    df$change <- as.numeric(df$change)
    df$changePercent <- as.numeric(df$changePercent)
    return(df[order(as.Date(df$transactionDate)),])
  } else if (type == "msci") {
    df$date <- strptime(df$date, format = "%Y/%m/%d")
    df$high <- num_format(df$high)
    df$open <- num_format(df$open)
    df$low <- num_format(df$low)
    df$close <- num_format(df$close)
    df$noOfTrades <- 0
    df$totalVolume <- 0
    return (df[order(as.Date(df$date)),])
  } else {
    df$date <- strptime(df$date, format = "%Y/%m/%d")
    df$high <- num_format(df$high)
    df$open <- num_format(df$open)
    df$low <- num_format(df$low)
    df$close <- num_format(df$close)
    df$noOfTrades <- num_format(df$noOfTrades)
    df$totalVolume <- num_format(df$totalVolume)
    return (df[order(as.Date(df$date)),])
  }
  }

#' Add adjusted prices to dividens to an xts object
#'
#' @param x xts object (data frames will be converted to xts)
#' @param symbol the symbol of the company
#'
#' @return
#' @export
#'
#'
#' @import magrittr
add_adj_price <- function(x, symbol) {
  if(!xts::is.xts(x)) x <- df_to_xts(x)
  dividens_table <- rvest::read_html(paste0(constants$dividens, symbol)) %>% rvest::html_elements("#dividendsTable")  %>%  rvest::html_table()
  divdns_xts<- xts::as.xts(dividens_table[[1]]$Amount, order.by = strptime(dividens_table[[1]]$`Distribution Date`, format = "%Y/%m/%d"))
  if(length(divdns_xts) > 0){
    x$Adjusted <- quantmod::Cl(x) * TTR::adjRatios(close = quantmod::Cl(x),  dividends = divdns_xts)$Div
  } else {
    x$Adjusted <- x$Close
  }
  return(x)
  }
