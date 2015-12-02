shinyUI(pageWithSidebar(
  headerPanel("Stock Visualisation and Prediction App"),
  
  sidebarPanel(
    wellPanel(
      radioButtons("stockid", label = h3("Select a Stock"), 
                   choices = list("Apple" = "AAPL", "Twitter" = "TWTR","Facebook" = "FB","Google" = "GOOG","LinkedIn" = "LNKD"),
                   selected = "AAPL")
                   
    ),
     

    selectInput(inputId = "chart_type",
                label = "Chart type",
                choices = c("Candlestick" = "candlesticks",
                            "Matchstick" = "matchsticks",
                            "Bar" = "bars",
                            "Line" = "line")
    ),
    
    dateRangeInput(inputId = "daterange", label = "Date Range",
                   start = Sys.Date() - 365, end = Sys.Date()),
    
    br(),
    radioButtons("forecast", label = h3("Forecasting  Model"), 
                 choices = list("ARIMA" = "ARIMA","Smoothing Spline" = "SPL","Structural Time Series" = "STS"),
                 selected = "ARIMA")


  ),
  
  mainPanel(
      plotOutput("plot"),
      verbatimTextOutput("forecastplot")
    
  )

))