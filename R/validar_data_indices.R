# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: validar_data_indices
#' @export
#'

validar_data_indices <- function(x = TRUE, nMes = 0) {
  dt <- ""
  if (nMes == 0) {
    dt_aux <- c(substr(x, 0, 2), substr(x, 4, 5), substr(x, 7, 10))
    dt <- paste(dt_aux[2], "/", dt_aux[3], sep = "")
    print(dt)

  } else if (nMes == -1) {
    dt <- DescTools::AddMonths(as.Date(x, "%d/%m/%Y"), nMes)
    dt_aux <-
      c(substr(dt, 0, 4), substr(dt, 6, 7), substr(dt, 9, 10))
    dt <- paste(dt_aux[2], "/", dt_aux[1], sep = "")
    print(dt)

  } else {
      dt <- DescTools::AddMonths(as.Date(x, "%d/%m/%Y"), nMes)
      dt_aux <-
        c(substr(dt, 0, 4), substr(dt, 6, 7), substr(dt, 9, 10))
      dt <- paste(dt_aux[2], "/", dt_aux[1], sep = "")
      print(dt)
  }

  return(dt)

}
