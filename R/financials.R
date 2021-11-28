#' General Function to obtain Financial Statements (No XBRL parsing)
#'
#' @param company_symbol  Company Symbol number
#' @param period_type financial statement reporting period type which is either "q" for quarterly or "y" for annually

#' @param statement Financial Statement name which can be one of the three : "income_statement", "balance_sheet" or "cash_flow"
#'
#' @return formatted financial statement as tibble data frame.
#'
#' @import magrittr rvest
#'
get_fin_statement <- function(company_symbol, period_type = "q", statement){
  url <- fin_parsURL(company_symbol,statement,period_type)
  fin_df <-url %>% rvest::read_html() %>% rvest::html_table() %>% .[[1]] %>% .[-((nrow(.)-3):nrow(.)),]
  header <- colnames(fin_df)
  switch(period_type,
         q = {
           temp_header <- header[-1] %>% {paste0("Q",lubridate::quarter(.),"_",lubridate::year(.))}
           header <- c(snakecase::to_any_case(header[1],"snake"), temp_header)
         },
         y = {
           temp_header <- header[-1] %>% {paste0("Y_",lubridate::year(.))}
           header <- c(snakecase::to_any_case(header[1],"snake"), temp_header)
         }
  )
  colnames(fin_df) <- header
  fin_df[,2:5] <- sapply(fin_df[,2:5],function(x){x<-gsub(",","",x)

  x <- suppressWarnings(as.numeric(x)*1000)
  }
  )
  return(fin_df)
}

#' Get income statement for specified company and reporting period
#'
#' @param company_symbol  Company Symbol number
#' @param period_type financial statement reporting period type which is either "q" for quarterly or "y" for annually
#'
#' @return formatted financial statement as tibble data frame.
#' @export
#'
#' @examples
#' get_income_statement(1010,"q")
get_income_statement <- function(company_symbol, period_type = "q"){
  get_fin_statement(company_symbol, period_type = "q", statement="income_statement")
}

#' Get balance sheet statement for specified company and reporting period
#'
#' @param company_symbol  Company Symbol number
#' @param period_type financial statement reporting period type which is either "q" for quarterly or "y" for annually
#'
#' @return formatted financial statement as tibble data frame.
#' @export
#'
#' @examples
#' get_balance_sheet(1010,"q")
get_balance_sheet <- function(company_symbol, period_type = "q"){
  get_fin_statement(company_symbol, period_type = "q", statement="balance_sheet")
}

#' Get cash flow statement for specified company and reporting period
#' #'
#' @param company_symbol  Company Symbol number
#' @param period_type financial statement reporting period type which is either "q" for quarterly or "y" for annually
#'
#' @return formatted financial statement as tibble data frame.
#' @export
#'
#' @examples
#' get_cash_flow(1010,"q")
#'
get_cash_flow <- function(company_symbol, period_type = "q"){
  get_fin_statement(company_symbol, period_type = "q", statement="cash_flow")
}


#' Getting XBRL financial statement links
#'
#' @param company_symbol Company Symbol number
#'
#' @return
#' @import magrittr rvest

get_xbrl_table <- function(company_symbol)
  {
  xbrl_page  <- fin_parsURL(company_symbol, statement_type = "xbrl",period = 0)

  page <- read_html(xbrl_page)
  links <- page %>%  html_elements("td")  %>%  .[-seq(1,to =30,by =6)] %>% html_element("a")

  df <- data.frame(matrix(rep(NA,25),nrow = 5))

    for(i in 1:5){
    for (j in 1:5){
      n <- ((i-1)*5)+j
      if (is.na(links[n]))
      {
        df[i,j] <- NA
      } else {
        df[i,j] <- links[n]  %>%  html_attr("href") %>% as.character()
      }
    }
  }

  table_links <- page %>%
    html_elements("td") %>%
    .[seq(1,to =30,by =6)] %>%
    html_text() %>%
    cbind(df)

  header <- page %>%
    html_element(".stock_table thead tr") %>%
    html_elements("th") %>%
    html_text()

  header[1] <- "period"
  colnames(table_links) <- header

  results <- table_links %>%
    tidyr::pivot_longer(-period, names_to = "year", values_to = "link") %>%
    dplyr::mutate(statement = paste0(period, "-", year))

return(results)
}




#' Get available XBRL statements
#'
#' @param xbrl_statement xbrl_table produced by the \link[tasi]{get_xbrl_table()}
#' @param period financial statement period which takes a form of (Qx or Annual)-Year. e.g "Q1-2021" or "Annual-2021"
#'
#' @return character vector of all available xbrl statements
#' @export

get_available_xbrl_statements <- function(xbrl_statement, period)
  {
  index <- which(xbrl_statement$statement == period)
  if( !is.na(xbrl_statement[index, "link"]) )
    {
    url <- xbrl_statement[index, "link"]
    p <- read_html(paste0(constants$domain,url))

    statements <- p %>% html_elements("body div[style]") %>% html_attr("class")
    statements[-which(statements %in% c("logo-div"))]
    }else {
      message("No statements are available for the selected period")
      NULL
    }
  }

#' XBRL Financial Statement Extractor
#'
#' @param company_symbol Company Symbol number
#' @param period financial statement period which takes a form of (Qx or Annual)-Year. e.g "Q1-2021" or "Annual-2021"
#' @param statement_type specific string that match XBRL specifications for financial statements. This can be obtained by \link[tasi]{get_available_xbrl_statements()}. Defaults to NULL.
#'
#' @return Data Frame of type tibble of specified XBRL Financial Statement
#' @export
#'
#' @examples
#' company_symbol <- 1020
#' period <- "Annual-2019"
#' get_statement_xbrl(company_symbol, period,"StatementOfOtherComprehensiveIncomeBeforeTax")

get_statement_xbrl <- function(company_symbol, period, statement_type=NULL)
  {

  xbrl_table <- get_xbrl_table(company_symbol)
  if(!is.null(xbrl <- get_available_xbrl_statements(xbrl_table,period)))
     {
       p <- read_html(paste0(constants$domain, xbrl_table[which(xbrl_table$statement == period),"link"]))

       if(!is.null(statement_type))
         {
         p %>% html_element(css = paste0("div.",statement_type)) %>% html_table(header = T)

         } else {
           chosen_statement <- menu(choices = xbrl)
           p %>% html_element(css = paste0("div.",xbrl[chosen_statement])) %>% html_table(header = T)
      }
    }else {
    NULL
    #stop("No statements are available for the selected period")
    }
}


