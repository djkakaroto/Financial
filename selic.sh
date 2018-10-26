#!/bin/bash

# Autor: Diego Lopes
# E-mail: djkakaroto@gmail.com

# Variaveis para estabelecer a URL de acesso a Calculadora do Cidadao + Metodo de correcao
METODO="method=corrigirPelaSelic"
CORRIGIR_SELIC="/corrigirPelaSelic.do?"
CALCIDADAO_URL="https://www3.bcb.gov.br/CALCIDADAO/publico"

# Definindo as varias de datas e valor a ser corrigido
DT_INICIAL="10/06/2014"
DT_FINAL=`date +"%d/%m/%Y"` # Pega a data do dia (hoje)
VALOR="264,90"

# Definindo o caminho do cURL e content type
CURL="/usr/bin/curl"
CONTENT_TYPE="Content-Type: application/x-www-form-urlencoded"

# Teste de preenchimento da URL
#echo "$CALCIDADAO_URL$CORRIGIR_SELIC$METODO""&dataInicial="$DT_INICIAL"&dataFinal="$DT_FINAL"&valorCorrecao="$VALOR

# Defindo arquivo a ser lido
ARQ_CSV="/Users/diego/Downloads/ValoresCasa/casa.csv"
#ARQ_CSV="/Users/diego/Documents/CantinhoAmor.csv"
#ARQ_CSV="/Users/diego/impostos_chacara.csv"

# Funcao para acessar a calculadora do cidadao e obter o retorno
# Param 1: Data Inicial
# Param 2: Data Final
# Param 3: Valor pago
exec_calc_cidadao()
{
# Executa a URL com os parametros usando o comando cURL
# -s silent
# -# progress bar
    RESPONSE=$($CURL -s --data "dataInicial=$1&dataFinal=$2&valorCorrecao=$3" \
        -H "$CONTENT_TYPE" \
        -X POST \
        $CALCIDADAO_URL$CORRIGIR_SELIC$METODO)

# Estabelecendo a consulta/filtro usando o grep
    HTML_QUERY=$(echo "$RESPONSE" | grep -o '<td style="text-align: right" class="fundoPadraoAClaro3 ">.*(REAL)' | grep -o "R$ .*")
    aux=($HTML_QUERY)

# Imprimindo a informacao
#    echo "Valor Inicial: " ${aux[1]}
#    echo "Valor Corrigido: " ${aux[4]} 

    echo "${aux[4]}"
}

# Leitura das datas e valor pelo teclado
read_date()
{
    read -p "Informe a data Inicial: " data_inicial
    read -p "Informe a data Final: " data_final
    read -p "Informe o valor: " valor_a_corrigir

    $DT_INICIAL = data_inicial
    $DT_FINAL = data_final
    $VALOR = valor_a_corrigir
}

read_csv()
{
    #OLDIFS=$IFS
    #IFS=" "
    while read -r line;
        do
            f1=`echo $line | cut -d \; -f1` # Numero da Parcela/Ano
            f2=`echo $line | cut -d \; -f2` # Data de Vencimento como base da data inicial
            f3=`echo $line | cut -d \; -f3` # Valor Pago
            #echo $f1 $f2 $f3
            getval=$(exec_calc_cidadao $f2 $DT_FINAL $f3)
            echo $f1 $f2 $DT_FINAL $f3 $getval

        done < $ARQ_CSV #~/Downloads/ValoresCasa/casa.csv
    
    #IFS=$OLDIFS
}


# Titulo do programa
echo "Calculador do Cidadao - Correcao pela Selic"
echo ""
read_csv;
#getval=$(exec_calc_cidadao $DT_INICIAL $DT_FINAL $VALOR)
#echo $getval