
.onLoad <- function(libname, pkgname) {
  .pkgenv <- parent.env(environment())
  res <- httr::GET("https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/reports-publications/historical-reports/")
  inx <- gregexpr(pattern = '(?<=z1/).*(?=\\/dz)' , text = res$headers$`content-location`,perl = TRUE)
  .pkgenv[["constants"]][["records_unique_key"]] <- as.character(regmatches(res$headers$`content-location`, inx))

  res <- httr::GET("https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/issuer-financial-calendars/dividends")
  inx <- gregexpr(pattern = '(?<=z1/).*(?=\\/dz)' , text = res$headers$`content-location`,perl = TRUE)
  .pkgenv[["constants"]][["dividends_unique_key"]] <- as.character(regmatches(res$headers$`content-location`, inx))
}


