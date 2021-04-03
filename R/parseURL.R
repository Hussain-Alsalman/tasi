#' Parsing URL call
#' This function construct the URL string used to request data from TADAWUL website.
#'
#' @param p pagination numeric variable
#' @param fromDate The start date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param toDate The end date of the query. Date is a string that needs to be in yyyy-mm-dd format
#' @param comSymbol Company Symbol number
#' @param type Type of URL cal. Choices are "company" or "index"
#' @param adjustment adjustment string variable. Options are "yes or "no"
#'
#' @return parsed URL string
parseURL <- function(p,fromDate, toDate, comSymbol = NULL , type, adjustment =FALSE) {
  if (type == "company") {
    return (
      paste(
        constants$comp,p,"&length=30&search%5Bvalue%5D=&search%5Bregex%5D=false&isNonAdjusted=0&startDate=", fromDate, "&toDate=" ,toDate,"&symbol=",comSymbol,"&_=1548771264757",sep = ""
      )
    )
  }
  if (type == "index") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$mrk,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=",
        ifelse(adjustment, "nonAdjustedType&old_tasi_current_sector=TASI", "adjustedType"),sep = ""
      )
    )
  }
  if (type == "msci") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$maci30,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "energy") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$energy,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "materials") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$materials,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "capitals") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$capitals,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "commercials") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$commercials,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "transportation") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$transportation,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "consumer_durables") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$consumer_durables,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "consumer_services") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$consumer_services,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "media") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$media,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "retailing") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$retailing,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "food_staples") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$food_staples,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "food_beverages") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$food_beverages,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "health") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$health,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "pharma") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$pharma,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "banks") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$banks,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "deversified") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$deversified,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "insurance") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$insurance,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "software") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$software,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "telecom") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$telecom,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "utilities") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$utilities,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "REITs") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$REITs,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }
  if (type == "real_estate") {
    from_date <- date_elements(fromDate)
    to_date <- date_elements(toDate)

    return (
      paste(
        constants$real_estate,p,"&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&sourceCallerId=datePicker&dateParameter=", from_date$Y,"%2F",from_date$M,"%2F",from_date$D,"+-+",to_date$Y,"%2F",to_date$M,"%2F",to_date$D,"&typeOfCall=", "adjustedType",sep = ""
      )
    )
  }

}
