#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
    headerPanel("Sales Filter"),
    sidebarPanel(
        sliderInput("range", "Range:", min = 39599853, max = 80931416, value = c(39599853,59599853))
    ),
    mainPanel(
        plotlyOutput('newHist')
    )
))
