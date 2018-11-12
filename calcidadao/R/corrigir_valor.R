# Author: Diego Lopes <https://github.com/djkakaroto>
# Version: 0.0.1
# Name: corrigir_valor
#' @export

# Curso para criar pacotes no R
# http://cursos.leg.ufpr.br/prr/capPacR.html

corrigir_valor <-
  function(value = "",
           method = c("SELIC", "IPC-A", "IGP-M"),
           startDate = FALSE,
           endDate = TRUE) {
    valor = value
    metodo = toupper(method)
    dtInicial = startDate
    dtFinal = endDate
    urlBase = ""

    # ----------------------------------------- #
    # Valida metodo (indicador) e retorna a URL #
    # ----------------------------------------- #
    if (is.character(metodo)) {
      if (pracma::strcmp("SELIC", metodo)) {
        urlBase <- retornaURL(metodo)
      } else if (pracma::strcmp("IPC-A", metodo)) {
        urlBase <- retornaURL(metodo)
      } else if (pracma::strcmp("IGP-M", metodo)) {
        urlBase = retornaURL(metodo)
      } else
      {
        return(cat("<Aviso> Metodo: ", indicator, " nao suportado!", sep = ""))
      }
    }
    # ------------------------------------------ #

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
    # # ------------------------------------------- #

    # # ------------------------------------------ #
    # # Validation of the endDate variable is Date #
    if (is.null(endDate) || isTRUE(endDate)) {
      # If null and true, add date now
      dtFinal = format(Sys.time(), "%d/%m/%Y")
      print(dtFinal)
    }

    # Validation - Continue #
    if (is.numeric(endDate) || is.array(endDate)) {
      print("Error: variable endDate type is Date!")
    } else if (is.character(endDate)) {
      print("is.character = true")
      if (nchar(endDate) >= 8 && nchar(endDate) <= 10) {
        print("size > 8 and < 10")

        result <- tryCatch({
          if (DescTools::IsDate(as.Date(endDate))) {
            dtFinal = endDate
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

    # Envia a URL para o site calculadora do cidadao
    URL_FULL = paste(
      urlBase,
      "&dataInicial=",
      dtInicial,
      "&dataFinal=",
      dtFinal,
      "&valorCorrecao=",
      valor,
      sep = ""
    )

    # Tratamento do retorno (resposta)
    # read_html - package(rvest)
    res <- xml2::read_html(URL_FULL)
    td <- res %>% rvest::html_nodes("td")
    fields <- rvest::html_text(td, trim = TRUE)

    # StrTrim - package(DescTools)
    filter <-
      DescTools::StrTrim(fields[15:19], pattern = "%$ (REAL)")
    # Imprime os valores
    # cat(filter[1], filter[3], filter[5])
    print(paste("Valor corrigido: R$ ", filter[5], sep = ""))

  }
# ------------------------------------------------------- #
