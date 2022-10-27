# nolint start: line_length_linter, object_name_linter.
#' MSCI Tadawul 30 Index
#' get all records of MSCI Tadawul 30 Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the MSCI Tadawul 30 Index
#' @export
#'
#' @examples
#' get_MSCI30("2020-01-01", "2020-12-31")

get_MSCI30 <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "MSCI30")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "msci30", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "MSCI30")
    return(fullData)
  }
}

#' Energy Industry Index
#' get all records of Energy Industry Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Energy Industry Index
#' @export
#'
#' @examples
#' get_energy("2020-01-01", "2020-12-31")
#'

get_energy <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date, index_type = "energy")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "energy", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "energy")
    return(fullData)
  }
}

#' Materials Index
#' get all records of Materials Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Materials Index
#' @export
#'
#' @examples
#' get_materials("2020-01-01", "2020-12-31")
#'

get_materials <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "materials")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "materials", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "materials")
    return(fullData)
  }
}

#' Capitals Index
#' get all records of Capitals Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Capitals Index
#' @export
#'
#' @examples
#' get_capitals("2020-01-01", "2020-12-31")
#'

get_capitals <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "capitals")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "capitals", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "capitals")
    return(fullData)
  }
}

#' Commercials Index
#' get all records of Commercials Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Commercials Index
#' @export
#'
#' @examples
#' get_MSCI30("2020-01-01", "2020-12-31")
#'

get_commercials <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date, index_type = "commercials")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "commercials", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "commercials")
    return(fullData)
  }
}

#' Transportation Index
#' get all records of Transportation Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Transportation Index
#' @export
#'
#' @examples
#' get_transportation("2020-01-01", "2020-12-31")
#'

get_transportation <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "transportation")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "transportation", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "transportation")
    return(fullData)
  }
}

#' Consumer Durables Index
#' get all records of Consumer Durables Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Consumer Durables Index
#' @export
#'
#' @examples
#' get_consumer_durables("2020-01-01", "2020-12-31")
#'

get_consumer_durables <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "consumer_durables")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "consumer_durables", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "consumer_durables")
    return(fullData)
  }
}

#' Consumer Services Index
#' get all records of Consumer Services Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param emd_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Consumer Services Index
#' @export
#'
#' @examples
#' get_MSCI30("2020-01-01", "2020-12-31")
#'

get_consumer_services <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "consumer_services")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "consumer_services", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "consumer_services")
    return(fullData)
  }
}

#' Media Index
#' get all records of Media Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Media Index
#' @export
#'
#' @examples
#' get_media("2020-01-01", "2020-12-31")
#'

get_media <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "media")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "media", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "media")
    return(fullData)
  }
}

#' Retailing Index
#' get all records of Retailing Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Retailing Index
#' @export
#'
#' @examples
#' get_retailing("2020-01-01", "2020-12-31")
#'

get_retailing <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "retailing")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "retailing", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "retailing")
    return(fullData)
  }
}

#' Food Staples Index
#' get all records of Food Staples Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Food Staples Index
#' @export
#'
#' @examples
#' get_food_beverages("2020-01-01", "2020-12-31")
#'

get_food_beverages <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "food_beverages")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "food_beverages", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "food_beverages")
    return(fullData)
  }
}

#' Health Index
#' get all records of Health Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Health Index
#' @export
#'
#' @examples
#' get_health("2020-01-01", "2020-12-31")
#'

get_health <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "health")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "health", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "health")
    return(fullData)
  }
}
#' Pharma Index
#' get all records of Pharma Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Pharma Index
#' @export
#'
#' @examples
#' get_pharma("2020-01-01", "2020-12-31")
#'

get_pharma <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date, index_type = "pharma")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "pharma", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type =  "pharma")
    return(fullData)
  }
}
#' Banks Index
#' get all records of Banks Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Banks Index
#' @export
#'
#' @examples
#' get_health("2020-01-01", "2020-12-31")
#'

get_banks <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date, index_type = "banks")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "banks", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "banks")
    return(fullData)
  }
}
#' Deversified Financials Index
#' get all records of Deversified Financials Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Deversified Financials Index
#' @export
#'
#' @examples
#' get_deversified("2020-01-01", "2020-12-31")
#'

get_deversified <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date, index_type = "deversified")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "deversified", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "deversified")
    return(fullData)
  }
}
#' Insurance Index
#' get all records of Insurance Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Insurance Index
#' @export
#'
#' @examples
#' get_insurance("2020-01-01", "2020-12-31")
#'

get_insurance <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "insurance")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "insurance", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "insurance")
    return(fullData)
  }
}
#' Telecommunication Index
#' get all records of Telecommunication Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Telecommunication Index
#' @export
#'
#' @examples
#' get_telecom("2020-01-01", "2020-12-31")
#'

get_telecom <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "telecom")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "telecom", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "telecom")
    return(fullData)
  }
}
#' Utilities Index
#' get all records of Utilities Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Utilities Index
#' @export
#'
#' @examples
#' get_utilities("2020-01-01", "2020-12-31")
#'

get_utilities <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "utilities")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "utilities", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "utilities")
    return(fullData)
  }
}
#' REITs Index
#' get all records of REITs Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the REITs Index
#' @export
#'
#' @examples
#' get_REITs("2020-01-01", "2020-12-31")
#'

get_REITs <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "REITs")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "REITs", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "REITs")
    return(fullData)
  }
}
#' Real Estate Index
#' get all records of Real Estate Index for a specified period.
#' @param start_date The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param end_date The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param use_cache logical operator for using cached data
#'
#' @return Data frame of the Real Estate Index
#' @export
#'
#' @examples
#' get_real_estate("2020-01-01", "2020-12-31")
#'

get_real_estate <- function(start_date, end_date, use_cache = TRUE) {
  validate_input(start_date, end_date)
  if (use_cache) {
    cache <- check_cached_index(start_date = start_date, end_date = end_date,  index_type = "real_estate")
  } else {
    cache <- list(is_cached = FALSE)
  }
  if (cache$is_cached) {
    return(cache$df)
  } else {
    fullData <- request_data(startDate = start_date, endDate = end_date, type = "real_estate", company_symbol = NULL, adjustPeriod = FALSE)
    cach_me_index(fullData, index_type = "real_estate")
    return(fullData)
  }
}
# nolint end
