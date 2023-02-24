# nolint start: line_length_linter, object_name_linter.
# API endpoint for listing all stocks
library("dplyr")
library("readr")

#Obtain all Data
all_symbols <- rjson::fromJSON(file = "https://www.saudiexchange.sa/tadawul.eportal.theme.helper/ThemeSearchUtilityServlet")
# Extract Column Names
col_names <- unique(unlist(sapply(all_symbols, function(x) names(x))))

# Create Empty Data Frame
df <- data.frame(matrix(nrow =  length(all_symbols), ncol = length(col_names)))
colnames(df) <- col_names

# Populate Data Frame with Data
for (i in seq_along(col_names)) {
  df[col_names[i]] <- sapply(all_symbols, function(el) {
    ifelse(!is.null(unlist(el[col_names[i]])), unlist(el[col_names[i]]), NA)})
}

# Obtain supplemental information for each company
base_url <-"https://www.saudiexchange.sa/wps/portal/saudiexchange/ourmarkets/main-market-watch"
res  <- httr::GET(base_url)
inx <- gregexpr(pattern = '(?<=z1/).*(?=\\/dz)' , text = res$headers$`content-location`,perl = TRUE)
unique_uri <- as.character(regmatches(res$headers$`content-location`, inx))

df_supplement <- rjson::fromJSON(file = paste(base_url,"/!ut/p/z1/",unique_uri,"/p0/IZ7_5A602H80OOMQC0604RU6VD10H0=CZ6_5A602H80O8DDC0QFK8HJ0O2067=NJgetMainNomucMarketDetails=/?sectorParameter=&tableViewParameter=1&iswatchListSelected=NO&requestLocale=en&_=1677051138477", sep = ""),simplify = FALSE)
col_names <- names(df_supplement$data[[1]])
df_supplement <- purrr::map_dfr(df_supplement$data,magrittr::extract, col_names)

# Split Data into Different Subsets
stock_indices_partial <- df %>%
  filter(market_type == "M") %>%
  select(-bond_type)
bonds_indices <- df %>%
  filter(market_type == "B") %>%
  select(-tradingNameEn, -tradingNameAr)


stock_indices <- df_supplement %>%
  select(-companyName) %>%
  left_join(stock_indices_partial, by = c("companySymbol" = "symbol")) %>%
  mutate(across(.cols = everything(), .fns = trimws)) %>%
  select(-colnames(.[5:42])) %>%
  unique()

#write in the Stock market Data
usethis::use_data(stock_indices, bonds_indices, overwrite = TRUE)
# nolint end
