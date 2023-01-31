#' Getting daily market daily report
#'
#' @return data frame containing all daily report for all companies listed in Saudi Stock Market
#' @export
#'
#' @examples
#' get_daily_market_stats()
#'
get_daily_market_stats <- function() {

url <- constants$daily_report
tbl <- rvest::read_html(url) %>%
  rvest::html_element(css = "div.tableStyle:nth-child(2) > table:nth-child(1)") %>%
  rvest::html_table(header = FALSE)
cl_col_names <- tbl[1, ] %>%
  stringr::str_remove_all(pattern = "\\(SAR\\)") %>%
  janitor::make_clean_names()

colnames(tbl) <- cl_col_names
tbl <- tbl[-1, ]
tbl <- tbl %>%
  dplyr::mutate(percent_change = stringr::str_remove_all(percent_change, pattern = "%")) %>%
  dplyr::mutate(dplyr::across(.cols = 2:10, .fns = num_format)) %>%
  dplyr::mutate(company = stringr::str_trim(stringr::str_remove_all(company, pattern = "\\*")))

tbl <- tbl %>%
  dplyr::left_join(tasi::stock_indices, by = c("company" = "tradingNameEn"))
return(tbl)
}
