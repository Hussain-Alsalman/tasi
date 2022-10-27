# nolint start: line_length_linter, object_name_linter.
#' Historical Data of a specified company for a specified period.
#'
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param company_symbol Company Symbol number
#' @param tidy logical operator to return tibble cleaned up data frame
#' @param use_cache logical operator for using cached data
#'
#' @return returns a data frame of company historical stock performance
#' @import tibble dplyr
#' @export
#'
#' @examples
#' #This will extract the historical stock records for ARAMCO for full year 2020
#' ## Not run:
#' get_company_records("2020-01-01", "2020-12-31", 2222)
#' ## End(Not run)
get_company_records <- function(start_date, end_date, company_symbol, tidy = FALSE, use_cache = TRUE) {

  validate_input(start_date, end_date, company_symbol)

  if (use_cache) {
    cache <- check_cached_company(start_date = start_date, end_date = end_date,  symbol = company_symbol)
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    if (tidy) {
      return_df <- cache$df %>%
        add_adj_price(symbol = company_symbol) %>%
        as_tibble(rownames = "Date") %>%
        add_column(.before = 1, symbol = rep(as.character(company_symbol), nrow(.))) %>%
        mutate(Date = lubridate::as_date(Date))
      return(return_df)
    }
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "company", company_symbol = company_symbol, adjustPeriod = FALSE)
    cach_me_com(fullData, company_symbol)
    if (tidy) {
      return_df <- fullData %>%
        add_adj_price(symbol = company_symbol) %>%
        as_tibble(rownames = "Date") %>%
        add_column(.before = 1, symbol = rep(as.character(company_symbol), nrow(.))) %>%
        mutate(Date = lubridate::as_date(Date))
      return(return_df)
    }
    return(fullData)
  }
}



#' Historical Data of a group of companies for specific period.
#'
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param symbol_vector vector of company symbol numbers
#' @param use_cache logical operator for using cached data
#' @param tidy logical operator to return aggregated tibble
#' @return returns a data frame of company historical stock performance
#'
#' @import tibble dplyr
#' @export
#
#' @examples
#' #This will extract the historical stock records for ARAMCO for full year 2020
#' ## Not run:
#' getSymbols("2020-01-01", "2020-12-31", c(2222, 2050))
#' ## End(Not run)
#'
#'
getSymbols <- function(start_date, end_date, symbol_vector, tidy = FALSE, use_cache = TRUE) {

  validate_input(start_date, end_date, company_symbol)

  if (tidy) {
    aggregate_tbl <- NULL
    for (symbol in symbol_vector) {
    df <- get_company_records(start_date, end_date, symbol, use_cache = TRUE)
    df <- add_adj_price(df, symbol = symbol)
    tbl <- df %>%
      as_tibble(rownames = "Date") %>%
      add_column(.before = 1, symbol = rep(as.character(symbol), nrow(.))) %>%
      mutate(Date = lubridate::as_date(Date))

    aggregate_tbl <- aggregate_tbl %>%
      bind_rows(tbl)
    }
    return(aggregate_tbl)
  }

  for (symbol in symbol_vector) {
    df <- get_company_records(start_date, end_date, symbol, use_cache = TRUE)
    df <- add_adj_price(df, symbol = symbol)
    df_colnames <- colnames(df)
    new_colnames <- paste0("T", symbol, ".", df_colnames)
    colnames(df) <- new_colnames
    df <- xts::convertIndex(x = df, value = "POSIXct")
    assign(paste0("T", symbol), df, envir = parent.frame())
  }
}

# nolint end
