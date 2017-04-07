#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
dataframe <- read.csv("trainWalmart.csv")
##tt<-subset(dataframe, format(as.Date(Date),"%Y")==2010)
agg <-aggregate(Weekly_Sales ~ Date, dataframe, sum)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$newHist <- renderPlotly({
      set.seed(1122)
      minX <- input$range[1]
      maxX <- input$range[2]
    #  dataX <- runif(dataframe$Weekly_Sales, minX, maxX)
    #  dataY<- runif(dataframe$Dates, minX, maxX)  

      dffilter <- agg[agg$Weekly_Sales>minX & agg$Weekly_Sales<maxX, ]
      
      # draw the histogram with the specified number of bins
        plot_ly(x=~dffilter$Date, y=~dffilter$Weekly_Sales, type = "bar")
      
    
  })
  
})
