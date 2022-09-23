
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
  if (file.exists(file.path(dir_path, paste0(as.character(symbol), ".rds")))) {
    df <- readRDS(file.path(dir_path, paste0(as.character(symbol), ".rds")))
    min_cached_date <- min(as.Date(df$transactionDate))
    max_cached_date <- max(as.Date(df$transactionDate))

    if (start_date >= min_cached_date &&
        end_date <= max_cached_date) {
      return(list(df = df[which(
        as.Date(df$transactionDate) >= start_date &
        as.Date(df$transactionDate) <= end_date
      ), ],
      is_cached = TRUE))
    } else if (end_date > max_cached_date && start_date >= min_cached_date) {
      df <- readRDS(file.path(dir_path, paste0(as.character(symbol), ".rds")))
      df <- df[which(
        as.Date(df$transactionDate) >= start_date
      ), ]
      add_df <- get_company_records(start_date = max_cached_date, end_date = end_date, company_symbol = symbol, use_cache = FALSE)
      complete_df <- rbind(add_df, df)
      complete_df <- complete_df[order(as.Date(complete_df$transactionDate)), ]
      return(list(df = complete_df[!duplicated(complete_df), ],
        is_cached = TRUE)
      )
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
cach_me_com <- function(df, symbol) {
  dir_path <- system.file("company_symbols", package = "tasi")
    saveRDS(df, file.path(dir_path, paste0(as.character(symbol), ".rds")))
}


#' Cashing the extracted data from the internet
#'
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date  The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#'
#' @return It returns a list that will include a cached data frame if exists
#'
check_cached_index <- function(start_date, end_date, index_type) {

  dir_path <- system.file("index_records", package = "tasi")
  if (file.exists(file.path(dir_path, paste0(index_type, ".rds")))) {
    df <- readRDS(file.path(dir_path, paste0(index_type, ".rds")))
    min_cached_date <- min(as.Date(df$date))
    max_cached_date <- max(as.Date(df$date))

    if (start_date >= min_cached_date &&
        end_date <= max_cached_date) {
      return(list(df = df[which(
         as.Date(df$date) >= start_date &
          as.Date(df$date) <= end_date
      ), ],
      is_cached = TRUE))
    } else if (end_date > max_cached_date && start_date >= min_cached_date) {
      df <- readRDS(file.path(dir_path, paste0(index_type, ".rds")))
      df <- df[which(
        as.Date(df$date) >= start_date
      ), ]
      add_df <- get_index_records(start_date = max_cached_date, end_date = end_date, use_cache = FALSE)
      complete_df <- rbind(add_df, df)
      complete_df <- complete_df[order(as.Date(complete_df$date)), ]
      return(list(df = complete_df[!duplicated(complete_df), ],
                  is_cached = TRUE)
      )
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
#'
cach_me_index <- function(df, index_type) {
  dir_path <- system.file("index_records", package = "tasi")
  saveRDS(df, file.path(dir_path, paste0(index_type, ".rds")))
}

#' This function ensures that there is a folder to save the downloaded files
#'
setup_caching_folders <- function() {
  if (!file.exists(system.file("index_records", package = "tasi"))) {
    dir.create(paste0(system.file(package = "tasi"), "/index_records"))
  }
  if (!file.exists(system.file("company_symbols", package = "tasi"))) {
    dir.create(paste0(system.file(package = "tasi"), "/company_symbols"))
  }
}
