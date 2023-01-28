# nolint start: line_length_linter, object_name_linter.
## code to prepare `constants` dataset goes here
constants <- list(
  domain = "https://www.saudiexchange.sa",
  records_unique_key = "",
  dividends_unique_key = "",
  records_base_url = "https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/reports-publications/historical-reports/!ut/p/z1/",
  dividends_base_url = "https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/issuer-financial-calendars/dividends/!ut/p/z1/",
  records = "/p0/IZ7_5A602H80O0HTC060SG6UT81216=CZ6_5A602H80O0HTC060SG6UT812E4=NJpopulateCompanyDetails=/",
  msci30 = "https://www.saudiexchange.sa/wps/portal/tadawul/markets/equities/indices/today/!ut/p/z1/rZLfT8IwEMf_Fh76CL3Bwg_fGhPmzCASBeZeltJVqdnapb059K-38EaiQyP31tznk0vvvjSjKc00f1evHJXRvPTv52ycD4e302AWQgLJJAA2jiBeLcJRNAe67QIgCmj2Jz-KlxNgK3a3mW-evD_6nw_h73z4oRhc8u8vAX6De8T6hgCBtm0HalcNhKkIHKpSOwK1NQWBgiPHj1oSEEaj1EjASmcaK2RfmLKU4ngQRzOx5xZz5E7lorHWk7nzTWNpuvAfvvY45LtYF_JA0wdpX4ytuBby2kOUY8Vb41AWNEXbSH-UrHOty6AbOOXuHPgmWJ3AMTknoCMaj1LTulqv1-lnIrdTnMUq7rNe7wuNBiRk/p0/IZ7_NHLCH082KGN530A68FC4AN2OM2=CZ6_22C81940L0L710A6G0IQM43GF0=N/?draw=3&columns%5B0%5D%5Bdata%5D=date&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=open&columns%5B1%5D%5Bname%5D=&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=high&columns%5B2%5D%5Bname%5D=&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=low&columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=close&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=totalVolume&columns%5B5%5D%5Bname%5D=&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=totalTurnover&columns%5B6%5D%5Bname%5D=&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=true&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B7%5D%5Bdata%5D=noOfTrades&columns%5B7%5D%5Bname%5D=&columns%5B7%5D%5Bsearchable%5D=true&columns%5B7%5D%5Borderable%5D=true&columns%5B7%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B7%5D%5Bsearch%5D%5Bregex%5D=false&start=",
  energy = "TENI:31",
  materials = "TMTI:32",
  capitals = "TCGI:33",
  commercials = "TCPI:34",
  transportation = "TTNI:35",
  consumer_durables = "TDAI:37",
  consumer_services = "TCSI:38",
  media = "TMDI:39",
  retailing = "TRLI:40",
  food_staples = "TFSI:41",
  food_beverages = "TFBI:42",
  health = "THEI:44",
  pharma = "TPBI:45",
  banks = "TBNI:46",
  deversified = "TDFI:47",
  insurance = "TISI:48",
  software = "TSSI:49",
  telecom = "TTSI:52",
  utilities = "TUTI:53",
  REITs = "TRTI:21",
  real_estate = "TRMI",
  mrk = "https://www.saudiexchange.sa/wps/portal/tadawul/markets/equities/indices/today/!ut/p/z1/rZFNTwIxEIZ_C4cepbOwgnprTFhrViIRcO1lU7pVavqxaQuL_97CzUSXGJ3bZJ4nM28GM1xhZvlevfGonOU69S9sUo9Gt1fZdQ4llNMMyKQAunjIx8UM8HMfAEWG2a_8gs6nQBbkbj1bL5M__psP-Xmf9SLzrB84RfwKfJOhFzgeeQLghyKA78_lSI_axtjeIEDQdd1QbcxQOIPgYLQNCFrvGgQNjzx-tBKBcDZKGxF4GdzOC3khnNZSHP8eMIt8Q20jD7h6lP7VecOtkP-9RGy5j3XkQdVi530i65CGzuNqSZ4obs1qVYGi75d6X5LB4BP_kbdL/p0/IZ7_NHLCH082KGN530A68FC4AN2OM2=CZ6_22C81940L0L710A6G0IQM43GF0=N/?draw=25&columns%5B0%5D%5Bdata%5D=date&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=open&columns%5B1%5D%5Bname%5D=&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=high&columns%5B2%5D%5Bname%5D=&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=low&columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=close&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=totalVolume&columns%5B5%5D%5Bname%5D=&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=totalTurnover&columns%5B6%5D%5Bname%5D=&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=true&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B7%5D%5Bdata%5D=noOfTrades&columns%5B7%5D%5Bname%5D=&columns%5B7%5D%5Bsearchable%5D=true&columns%5B7%5D%5Borderable%5D=true&columns%5B7%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B7%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=",
  dividens = "/p0/IZ7_5A602H80OOMQC0604RU6VD10J3=CZ6_5A602H80O8HH70QFKI8IRJ00P3=NJgetDividendsDetails=/",
  daily_report = "https://www.saudiexchange.sa/Resources/Reports/DetailedDaily_en.html",
  fin_statement = list(
    url = "https://www.saudiexchange.sa/wps/portal/tadawul/market-participants/issuers/issuers-directory/company-details/!ut/p/z1/pdE7j4JAFAXg32JBPYcBBO1mQYEFSVDxMY0ZdhOWDa8CNf57x0dDsuIab3eT7xTnXsLJhvBKHPJMtHldiULuWz7cRV5oe7Bo4E6WGtjQmdnzyKcAyPoKKLUtdaQjRGiqErjw45muIdYIfynv-pEJFjNvNV1JatH38tD_l8eDYXie510CjzqSTILAsQ2KD-MO-k7UBX_coBdcSl5BT4tPwrOiTm8f_WnbZqxAQSu-xXFfKLLlV102ojotTmVaS2RSqKQpkyTZIPd_jSJjg8EZmQYrkg!!/p0/IZ7_NHLCH082KGET30A6DMCRNI2086=CZ6_NHLCH082KGET30A6DMCRNI2000=NJstatementsTabData=/?",
    period = c(
      "y" = "&reportType=0",
      "q" = "&reportType=1"
      ),
    statement_type = c(
      "balance_sheet" = "statementType=0",
      "income_statement" = "statementType=1",
      "cash_flow" = "statementType=2",
      "xbrl" = "statementType=4"
      )
    )
  )

usethis::use_data(constants, overwrite = TRUE, internal = TRUE)
# nolint end
