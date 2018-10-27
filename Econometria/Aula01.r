# Removendo objetos da memória
rm( list = ls() )

# Series temporais com forecast (ts)
#install.packages("forecast")

# Usando a biblioteca forecast
library(forecast)

# Links para trading in R
# https://www.datacamp.com/community/tutorials/r-trading-tutorial
# https://www.datacamp.com/courses/model-a-quantitative-trading-strategy-in-r/
# https://rpubs.com/lance4869/delta_hedging
# https://rpubs.com/OmarMa/Equity_Portfolio_Hedging
# https://www.quantinsti.com/blog/predictive-modeling-algorithmic-trading
# https://github.com/Apress/automated-trading-with-r

# Pacotes para trabalhar com trading no R (TTR)
# install.packages("TTR")
# Usando o pacote de trading
# library(TTR)
# JavaScript Charting Library
# install.packages("dygraphs")

# Definindo variaveis de data
data.inicio = "2000-01-01"
data.fim    = "2018-09-30"
tipo        = "ts"
periodicidade = "monthly"

# Dados Quandl
#install.packages("Quandl")
library(Quandl)
# IPCA Mensal
ipca <- Quandl( "BCB/433", type = tipo, collapse = periodicidade, start_date = data.inicio, end_date = data.fim )
# IPCA Mensal Acumulado
ipca.m <- Quandl( "BCB/13522", type = tipo, collapse = periodicidade, start_date = data.inicio, end_date = data.fim )
# Cambio
cambio <- Quandl( "BCB/3696", type = tipo, collapse = periodicidade, start_date = data.inicio, end_date = data.fim )

head(ipca)
plot(ipca)

plot(decompose(ipca))

acf(ipca, lag.max = 120)
pacf(ipca, lag.max = 120)

auto.arima(ipca)

modelo <- arima(ipca, order = c(1,0,0), seasonal = list(order = c(1,0,1), period=12))

residuos <- residuals(modelo)

par(mfrow=c(3,1))
plot(residuos)
acf(residuos)
pacf(residuos)
par(mfrow=c(1,1))

ks.test(residuos, "pnorm")
shapiro.test(residuos)

hist(residuos, probability = TRUE, breaks = 10)

previsao <- forecast(modelo, h=6)
plot(previsao)