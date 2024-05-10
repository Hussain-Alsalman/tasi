# nolint start: line_length_linter, object_name_linter.
#' Stocks Information Dataset
#'
#' A dataset containing the stock symbols and other attributes of over 200 companies on Tadawul website.
#'  The variables are as follows:
#'
#' @format A data frame with 212 rows and 8 variables:
#' \describe{
#'   \item{sectorName}{Sector name to which companies belog e.g.("Bank","Energy" ..etc)}
#'   \item{sectorRef}{Sector id to which companies belog e.g.("31", ..etc)}
#'   \item{companyRef}{Same as companySymbol aka:Ticker e.g.("8220","4002" ..etc)}
#'   \item{crynomName}{Company short name in English e.g aka:("SARCO","SAUDI ARAMCO" ..etc)}
#'   \item{companySymbol}{Company Symbol aka:Ticker e.g.("8220","4002" ..etc)}
#'   \item{companyUrl}{Company profile URL e.g.("/wps/portal/tadawul/markets/equities/indices/today/!ut/ ..")}
#'   \item{watchListId}{Watch list id. This is usually set to zeros unlist you have added stocks to watch on the website e.g.("0", "0", "0")}
#'   \item{watchlist}{This Flag for if the stock is in Watch list or not e.g.("FALSE", "FALSE")}
#'   \item{companyNameEN}{Full company name in English e.g.("Weqaya Takaful Insurance and Reinsurance Co.")}
#'   \item{companyNameAR}{Full company name in Arabic e.g.("شركة وقاية للتأمين وإعادة التأمين التكافلي")}
#'   \item{companyName}{Company name in English e.g.("Weqaya Takaful Insurance and Reinsurance Co.")}
#'   \item{market_type}{Market type to differentiate it from Bond Market. Here, it is always "M" here}
#'   \item{tradingNameEn}{Short company name in English e.g.("Weqaya Takaful")}
#'   \item{tradingNameAr}{Short company name in Arabic e.g.("وقاية للتكافل")}
#'   \item{isin}{System code, usually not used}
#' }
"stock_indices"

#' Bond Information Dataset
#'
#' A dataset containing the bond symbols and other attributes of over 73 bonds on Tadawul website.
#'  The variables are as follows:
#'
#' @format A data frame with 212 rows and 8 variables:
#' \describe{
#'   \item{symbol}{bond Symbol aka:Ticker e.g.("2315", "4035" ..etc)}
#'   \item{companyNameEN}{Full bond name in English e.g.("Sadara Sukuk", "Bahri Sukuk")}
#'   \item{companyNameAR}{Full bond name in Arabic e.g.("صكوك ساتورب" ,"صكوك كهرباء السعودية 3")}
#'   \item{companyName}{Bond name in English e.g.("Sadara Sukuk" "Bahri Sukuk")}
#'   \item{market_type}{Market type to differentiate it from Stock Market}
#'   \item{isin}{System code, usually not used}
#'   \item{bond_type}{Bondy type. "S" for private, "G" for government}
#' }
"bonds_indices"
# nolint end
