# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: imprimir_valor
#' @export

imprimir_valor <- function( url_request ) {

  # Envia a URL para o site calculadora do cidadao
  # Tratamento do retorno (resposta)
  # read_html - package(rvest)
  #library(rvest)
  #print(URL_FULL)
  res <- xml2::read_html(url_request)
  td <- res %>% rvest::html_nodes("td")
  fields <- rvest::html_text(td, trim = TRUE)

  # StrTrim - package(DescTools)
  filter <-
    DescTools::StrTrim(fields[15:19], pattern = "%$ (REAL)")
  # Imprime os valores
  # cat(filter[1], filter[3], filter[5])
  return (paste("R$ ", filter[5], sep = ""))
  #print(fields)


}

