
.onLoad <- function(libname, pkgname) {

  #Obtain URL unique segment for retrieving historical records
  .pkgenv <- parent.env(environment())
  res <- httr::GET("https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/reports-publications/historical-reports/")
  inx <- gregexpr(pattern = '(?<=z1/).*(?=\\/dz)' , text = res$headers$`content-location`,perl = TRUE)
  .pkgenv[["constants"]][["records_unique_key"]] <- as.character(regmatches(res$headers$`content-location`, inx))

  #Obtain URL unique segment for retrieving dividends
  res <- httr::GET("https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/issuer-financial-calendars/dividends")
  inx <- gregexpr(pattern = '(?<=z1/).*(?=\\/dz)' , text = res$headers$`content-location`,perl = TRUE)
  .pkgenv[["constants"]][["dividends_unique_key"]] <- as.character(regmatches(res$headers$`content-location`, inx))

#   #Obtain URL unique segment for retrieving financial statements
#   base_url <- .pkgenv[["constants"]][["domain"]]
#   base_url <- "https://www.saudiexchange.sa"
#
#   res <- httr::GET(base_url) |>
#     httr::content() |>
#     rvest::html_elements("a")
#
#   link <- res |>
#     grep(pattern = "company-profile-main")
#   inx <- res[link[1]] |>
#     rvest::html_attr('href')
#
#
#
#   res <-  httr::GET(paste(base_url,inx, sep = ""))
#   inx <- gregexpr(pattern = '(?<=z1/).*(?=\\/dz)' , text = res$headers$`content-location`,perl = TRUE)
#   as.character(regmatches(res$headers$`content-location`, inx))
#
#
#
#
#
#
#
#
#
#
#   inx <- res[link[1]] |>
#     rvest::html_attr('href') |>
#     gregexpr(pattern = '(?<=z1/).*(?=\\/)' , perl = TRUE)
#   .pkgenv[["constants"]][["fin_unique_key"]] <- as.character(regmatches(res[link[1]] |>
#                                                                           rvest::html_attr('href'), inx))
 }
