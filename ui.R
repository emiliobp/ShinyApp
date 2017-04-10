#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Select Car features to calculate the MPG"),
    sidebarPanel (
        sliderInput('cyl', 'Select the number of Cylinders:', 6, min = 3, max= 8, step = 1),
        sliderInput('horse', 'Select the HorsePower:', 125, min = 50, max= 230, step = 5),
        sliderInput('weight', 'Select the Weight:', 3000, min = 1650, max= 5000, step = 100),
        selectInput("trans", "Choose the Transmission", c ("Automatic", "Manual") ),
        submitButton('Submit')
    ),
    mainPanel(
        h3("The MPG value based on their features is:"),
        textOutput('pred')
    )
))
