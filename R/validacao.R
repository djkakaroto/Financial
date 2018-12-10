# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: validacao
#' @export

validacao <- function(x){

  # Verifica se é número
  if(DescTools::IsNumeric(as.double(x))){
    return("double")
  }else if(DescTools::IsNumeric(as.numeric(x))){
    return("numeric")
  }else if(DescTools::IsDate(as.Date(x))){
    return("date")
  }else{
    return("caracter")
  }

}
