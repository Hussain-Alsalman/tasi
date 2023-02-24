# nolint start: line_length_linter, object_name_linter.
## code to prepare `constants` dataset goes here
constants <- list(
  domain = "https://www.saudiexchange.sa",
  records_unique_key = "",
  dividends_unique_key = "",
  fin_unique_key = "",
  records_base_url = "https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/reports-publications/historical-reports/!ut/p/z1/",
  dividends_base_url = "https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/issuer-financial-calendars/dividends/!ut/p/z1/",
  fin_base_url = "https://www.saudiexchange.sa/wps/portal/saudiexchange/newsandreports/issuer-financial-calendars/dividends/!ut/p/z1/",
  records = "/p0/IZ7_5A602H80O0HTC060SG6UT81216=CZ6_5A602H80O0HTC060SG6UT812E4=NJpopulateCompanyDetails=/?draw=1&columns[0][data]=transactionDateStr&columns[0][name]=&columns[0][searchable]=true&columns[0][orderable]=false&columns[0][search][value]=&columns[0][search][regex]=false&columns[1][data]=todaysOpen&columns[1][name]=&columns[1][searchable]=true&columns[1][orderable]=false&columns[1][search][value]=&columns[1][search][regex]=false&columns[2][data]=highPrice&columns[2][name]=&columns[2][searchable]=true&columns[2][orderable]=false&columns[2][search][value]=&columns[2][search][regex]=false&columns[3][data]=lowPrice&columns[3][name]=&columns[3][searchable]=true&columns[3][orderable]=false&columns[3][search][value]=&columns[3][search][regex]=false&columns[4][data]=previousClosePrice&columns[4][name]=&columns[4][searchable]=true&columns[4][orderable]=false&columns[4][search][value]=&columns[4][search][regex]=false&columns[5][data]=change&columns[5][name]=&columns[5][searchable]=true&columns[5][orderable]=false&columns[5][search][value]=&columns[5][search][regex]=false&columns[6][data]=changePercent&columns[6][name]=&columns[6][searchable]=true&columns[6][orderable]=false&columns[6][search][value]=&columns[6][search][regex]=false&columns[7][data]=volumeTraded&columns[7][name]=&columns[7][searchable]=true&columns[7][orderable]=false&columns[7][search][value]=&columns[7][search][regex]=false&columns[8][data]=turnOver&columns[8][name]=&columns[8][searchable]=true&columns[8][orderable]=false&columns[8][search][value]=&columns[8][search][regex]=false&columns[9][data]=noOfTrades&columns[9][name]=&columns[9][searchable]=true&columns[9][orderable]=false&columns[9][search][value]=&columns[9][search][regex]=false&length=25&search[value]=&search[regex]=false",
  msci30 = "MT30",
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
  daily_report = "https://www.saudiexchange.sa/Resources/Reports-v2/DetailedDaily_en.html",
  fin_statement = list(
    url = "https://www.saudiexchange.sa/wps/portal/saudiexchange/hidden/company-profile-main/!ut/p/z1/04_Sj9CPykssy0xPLMnMz0vMAfIjo8ziTR3NDIw8LAz83d2MXA0C3SydAl1c3Q0NvE30w1EVGAQHmAIVBPga-xgEGbgbmOlHEaPfAAdwNCCsPwqvEndzdAVYnAhWgMcNXvpR6Tn5SZDwyCgpKbBSNVA1KElMSSwvzVEFujE5P7cgMa8yuDI3KR-oyAgI9INT8_QLckMjDDIDcsN1HRUBQR0L9w!!/p0/IZ7_5A602H80O0VC4060O4GML81G57=CZ6_5A602H80OGF2E0QF9BQDEG10K4=NJstatementsTabData=/?",
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
