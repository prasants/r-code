if (!require(quantmod)) {
  stop("This app requires the quantmod package. To install it, run 'install.packages(\"quantmod\")'.\n")
}

source("price_forecast.R")

shinyServer(function(input, output) {
  
   
  dataInput <- reactive({
    
    getSymbols(input$stockid, src = "yahoo", 
                                    from = input$daterange[1],
                                    to = input$daterange[2],
                                    return.class = "timeSeries",
                                    auto.assign = FALSE)
    
   
  })
  
  
  output$plot <- renderPlot({    
    stockdata <- dataInput()
    
   
    chartSeries(stockdata,
                type      = input$chart_type,
                subset    = paste(input$daterange, collapse = "::"),
                TA="addVo();addBBands();addCCI()",
                theme     = "white")
    
    
  })

  
  
  output$forecastplot <- renderPrint({    
    stockdata <- dataInput()
    
    
      
      if (input$forecast == "STS") {
        forcdata <- forecast_STS(dataInput())
        summary(forcdata)
      }
      if (input$forecast == "SPL") {
        forcdata <- forecast_spl(dataInput())
        summary(forcdata)
      }
      if (input$forecast == "ARIMA") {
        forcdata <- forecast_Arima(dataInput())
        summary(forcdata)
      }
      
         

     
    
  })
  
})