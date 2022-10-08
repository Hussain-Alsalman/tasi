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
df_supplement <- rjson::fromJSON(file = "https://www.saudiexchange.sa/wps/portal/tadawul/markets/equities/indices/today/!ut/p/z1/rZLRTsIwFIafxYteSs9gAfVuIWHWTBICw9mbpesaqdnapT04eHsHdyZSNHrumvN9af6_pZwWlBvxod8EamtEM5xf-bQcj-d30X0MGWSzCJJpCmz1HE_SBdCXEABpRPmv_JQtZ5CsksftYrsZ_MnffIh_5sOFSeC6z4PIMgoD54q-At90EAROIc9AIMVaGfp0Lcvw2DvE7oEAgb7vR7pqR9K2BA5tYzyBztmaQC1Q4LFTBKQ1qAwScMrbvZPqVtqmUfL0dzzlKCpmanWgRaY9qnpu204Yrfx_XyR3wmGJwutS7p0byNIPS-tosUnWjHZtnucFaPYe8-rY33wCjfF_BA!!/p0/IZ7_NHLCH082KGN530A68FC4AN2OE0=CZ6_22C81940L0L710A6G0IQM43GF0=NEchart_tasi_current_sector!TASI==/!?_=1616168200088")
df_supplement <- t(sapply(df_supplement$data, function(x) unlist(x)))
df_supplement <- as.data.frame(df_supplement)

# Split Data into Different Subsets
stock_indices_partial <- df %>%
  filter(market_type == "M") %>%
  select(-bond_type)
bonds_indices <- df %>%
  filter(market_type == "B") %>%
  select(-tradingNameEn, -tradingNameAr)


stock_indices <- df_supplement %>%
  select(-companyName) %>%
  left_join(stock_indices_partial, by = "symbol") %>%
  mutate(across(.cols = everything(), .fns = trimws))

#write in the Stock market Data
usethis::use_data(stock_indices, bonds_indices, overwrite = TRUE)
# nolint end
