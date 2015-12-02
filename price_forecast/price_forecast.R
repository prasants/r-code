library(quantmod)
library(timeSeries)
library(forecast)

# Structural Time Series
forecast_STS <- function(series){
  price <- series[,6]
  sts.fit <-  StructTS(price)
  sts.forecast <- forecast(sts.fit, h=5)
  return(sts.forecast)
  
  
}

# ARIMA Model
forecast_Arima <- function(series){
  price <- series[,6]
  arima.fit <- auto.arima(price)
  series.arima.forecast <- forecast(arima.fit,h=5)
  return(series.arima.forecast)
}


# Cubic Spline Smoothing
forecast_spl <- function(series){
  price <- series[,6]
  series.spline.forecast <- splinef(price, h = 5)
  return (series.spline.forecast)
}


