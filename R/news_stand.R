#' Getting daily market daily report
#' This function enables you to fetch all the news and public announcments made by the company specified by its symbol
#'
#' @param symbol Valid company symbol. Company Symbols are usually 4 digit number with non-leading zero. for example 2222, 2010"
#' @param language You can specify the news lanaguage. It is either "ar" or "en". Default value is "ar" because large number of news are not translated in English.
#'
#' @return returns a data frame of company news and announcments
#' @import glue
#' @export
#'
get_news <- function(symbol, language = 'ar') {
  validate_input(as.character(Sys.Date()), as.character(Sys.Date()),company_symbol =  symbol)
req <-  httr::POST(paste0(constants$announcements_base_url,constants$announcements_unique_key,constants$announcments),
                   httr::add_headers(`content-language` = 'ar'),
                   httr::set_cookies(`com.ibm.wps.state.preprocessors.locale.LanguageCookie` = language),
                   body = list(
                        annoucmentType = "1_-1",
                        symbol = symbol,
                        sectorDpId = "-1",
                        searchType = "1",
                        fromDate = "",
                        toDate = "",
                        datePeriod = "",
                        productType = "",
                        advisorsList = "-1",
                        textSearch = "",
                        pageNumberDb = "1",
                        pageSize = "1000"),
                   encode = "form")
df <- httr::content(req,type = "application/json")
if (length(df$announcementList) == 0) {
  stop(glue::glue("There is no news for the company with the symbol { symbol }"))}
else {
df <- purrr::map(df$announcementList, function(x) as.data.frame(t(unlist(x)))) |>
  purrr::list_rbind()
  xts::xts(df, order.by = as.Date(df$newsDateStr,format = "%d/%m/%Y %H:%M:%S"))
}
}
