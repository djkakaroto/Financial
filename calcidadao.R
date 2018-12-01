Package: bcb_calcidadao
Title: "Uma implementacao para corrigir valores pelos indicadores, 
  usando a Calculadora do Cidadao do Banco Central do Brasil"
Version: 0.1
Authors@R: person("Diego", "Lopes", email = "djkakaroto@gmail.com", role = c("aut", "cre"))
Description: "x=indicador
  y=nome"
Author: "Diego Lopes <djkakaroto@gmail.com> [aut, cre]" 
Maintainer: "Diego Lopes <djkakaroto@gmail.com>"
License: GPL

library(curl)

hoje <- format(Sys.time(), "%d/%m/%Y")
metodos <- c("selic", "ipca", "igpm")

is.vector(metodos)

metodos[2]
metodo_calcidadao <- function(x = ""){
  
  if(x == ""){
    return("Se vazio retorna selic")
  }
  return("falso")
  
}

Sys.Date()
rm(list = ls())

teste <- metodo_calcidadao()

# Variaveis para estabelecer a URL de acesso a Calculadora do Cidadao + Metodo de correcao
METODO="method=corrigirPelaSelic"
CORRIGIR_SELIC="/corrigirPelaSelic.do?"
CALCIDADAO_URL="https://www3.bcb.gov.br/CALCIDADAO/publico"

# Definindo as varias de datas e valor a ser corrigido
DT_INICIAL="10/06/2014"
#DT_FINAL=`date +"%d/%m/%Y"` # Pega a data do dia (hoje)
DT_FINAL="07/11/2018"
VALOR="264,90"

req <- curl_fetch_memory("CALCIDADAO_URL" + "CORRIGIR_SELIC" + "METODO")

salve <- paste(CALCIDADAO_URL,CORRIGIR_SELIC,METODO, sep = "")


str(salve)