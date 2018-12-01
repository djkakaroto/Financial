# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: converte_valor
#' @export
#'

converte_valor <- function( value = TRUE ){

  valor = ""
  # # Convert value para double
  # DescTools::IsNumeric(as.double(value))
  # # Substitui o . por ,
  value = gsub("\\,", "\\.", value)
  value = as.double(value)
  print(value)

  # # ------------------------------------------- #
  # # Validation of the value variable is numeric #
  if (is.character(value)) {
    print("Error: value variable can not character, type value is numeric!")
  } else if (is.double(value) ||
             is.integer(value) || is.numeric(value)) {
    if (value > 0.0) {
      valor = gsub("\\.", "\\,", value)
      print(valor)
    } else{
      print("Error: value can not negative!")
    }
  }

  return(valor)
}
