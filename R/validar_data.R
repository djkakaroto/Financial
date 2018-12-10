# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: validar_data
#' @export
#'

validar_data <- function(valDate = TRUE) {

  dtFinal = ""

  # # ------------------------------------------ #
  # # Validation of the endDate variable is Date #
  if (is.null(valDate) || isTRUE(valDate)) {
    # If null and true, add date now
    dtFinal = format(Sys.time(), "%d/%m/%Y")
    print(dtFinal)
  }

  # Validation - Continue #
  if (is.numeric(valDate) || is.array(valDate)) {
    print("Error: variable endDate type is Date!")
  } else if (is.character(valDate)) {
    print("is.character = true")
    if (nchar(valDate) >= 8 && nchar(valDate) <= 10) {
      print("size > 8 and < 10")

      result <- tryCatch({
        if (DescTools::IsDate(as.Date(valDate))) {
          dtFinal = valDate
          # print(dtFinal)
        }
      }, warning = function(war) {
        print("Message tryCatch: <Aviso> Date have warnning!")
      }, error = function(err) {
        print("Message tryCatch: <Error> Date is not valid!")
      }, finally = {
        #print("Definindo a data de hoje")
      })
      #cat("Message tryCatch: ", result)
      print(dtFinal)
    } else{
      print("Date is not valid!")
    }
  }

  return(dtFinal)
}
