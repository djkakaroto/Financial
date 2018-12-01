# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: retornaURL
#' @export

retornaURL <- function(indicator = FALSE) {
  URL_BASE = "https://www3.bcb.gov.br/CALCIDADAO/publico"

  indicator = toupper(indicator)
  res = ""
  switch(
    indicator,
    "SELIC" = {
      ACTION = "/corrigirPelaSelic.do?"
      METODO = "method=corrigirPelaSelic"
      res = paste(URL_BASE, ACTION, METODO, sep = "")
    },
    "IPC-A" = {
      ACTION = "/corrigirPorIndice.do?"
      ABA = "1"
      METODO = "method=corrigirPorIndice"
      selIndice = "00433IPC-A"
      res = paste(URL_BASE, ACTION, METODO, "&aba=", ABA, "&selIndice=", selIndice, sep = "")
    },
    "IGP-M" = {
      ACTION = "/corrigirPorIndice.do?"
      ABA = "1"
      METODO = "method=corrigirPorIndice"
      selIndice = "00189IGP-M"
      res = paste(URL_BASE, ACTION, METODO, "&aba=", ABA, "&selIndice=", selIndice, sep = "")
    },
    "INPC" = {
      ACTION = "/corrigirPorIndice.do?"
      ABA = "1"
      METODO = "method=corrigirPorIndice"
      selIndice = "00188INPC"
      res = paste(URL_BASE, ACTION, METODO, "&aba=", ABA, "&selIndice=", selIndice, sep = "")
    }
  )
  return(res)
}
