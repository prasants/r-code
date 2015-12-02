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
  plot(forecast(fit,h=5))
  series.arima.forecast <- forecast(arima.fit,h=5)
  return(series.arima.forecast)
}


# Cubic Spline Smoothing
forecast_spl <- function(series){
  price <- series[,6]
  series.spline.forecast <- splinef(price, h = 5)
  plot(series.spline.forecast)
  #rm(series.spline.forecast) # cleanup cubic spline
  return (series.spline.forecast)
}


