# API endpoint for listing all stocks
library("dplyr")
library("readr")
#Obtain all Data
all_symbols<-rjson::fromJSON(file = "https://www.tadawul.com.sa/tadawul.eportal.theme.helper/ThemeSearchUtilityServlet")

# Extract Column Names
col_names <- unique(unlist(sapply(all_symbols, function(x) names(x))))

# Create Empty Data Frame
df <- data.frame(matrix(nrow =  length(all_symbols), ncol = length(col_names)))
colnames(df) <- col_names

# Populate Data Frame with Data
for ( i in seq_along(col_names)){
  df[col_names[i]]<- sapply(all_symbols, function(el) {
    ifelse(!is.null(unlist(el[col_names[i]])), unlist(el[col_names[i]]),NA)})
}

# Split Data into Different Subsets
stock_indices <- df %>% filter(market_type == "M") %>%  select(-bond_type)
bonds_indices <- df %>% filter(market_type == "B") %>% select(-tradingNameEn, -tradingNameAr)

#write in the Stock market Data
usethis::use_data(stock_indices, bonds_indices)
