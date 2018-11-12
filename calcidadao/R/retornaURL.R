# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: retornaURL
#' @export

retornaURL <- function(indicator = FALSE){

  URL_BASE = "https://www3.bcb.gov.br/CALCIDADAO/publico"

  indicator = toupper(indicator)
  res = ""
  switch(indicator,
         "SELIC"={
           ACTION="/corrigirPelaSelic.do?"
           SELIC="method=corrigirPelaSelic"
           res = paste(URL_BASE, ACTION, SELIC, sep = "")
         },
         "IPC-A"={
           ACTION="/corrigirPorIndice.do?"
           IPCA="method=corrigirPorIndice"
           res = paste(URL_BASE, ACTION, IPCA, sep = "")
         },
         "IGP-M"={
           ACTION="/corrigirPelaSelic.do?"
           SELIC="method=corrigirPelaSelic"
           res = paste(URL_BASE, ACTION, "IGP-M", sep = "")
         }
         )
    return(res)
}
