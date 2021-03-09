
#' Cetting Cached historical data for companies
#'
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date  The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param symbol Company Symbol number
#'
#' @return
#' It returns a list that will include a cached data frame if exists
#'
#'
check_cached_company <- function(start_date, end_date, symbol) {
  dir_path <- system.file("company_symbols", package = "tasi")
  if (file.exists(file.path(dir_path,paste0(as.character(s),".rds")))) {
    df <- readRDS(file.path(dir_path,paste0(as.character(s),".rds")))
    min_cached_date <- min(as.Date(df$transactionDate))
    max_cached_date <- max(as.Date(df$transactionDate))

    if (start_date > min_cached_date &&
        end_date < max_cached_date) {
      return (list(df = df[which(
        as.Date(df$transactionDate) >= start_date &
          as.Date(df$transactionDate) <= end_date
      ), ],
      is_cached = TRUE))
    } else {
      return(list(
        is_cached = FALSE
      ))
    }
  } else {
    return(list(
      is_cached = FALSE
    ))
  }
}



#' Cashing the extracted data from the internet
#'
#' @param df extracted data
#' @param symbol the company symbol
#'
cach_me <- function(df, symbol){
  dir_path <- system.file("company_symbols", package = "tasi")
    saveRDS(df, file.path(dir_path,paste0(as.character(s),".rds")))
}


