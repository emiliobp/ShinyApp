#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("Automatic", "Manual")
model <- lm(mpg ~ cyl + hp + wt + am, data = mtcars)
predictMPG <- function (cyl, horse, weight, trans)
{
    uidata <- data.frame(cyl=cyl, hp=horse, wt=weight, am=trans)
    predict(model, uidata)
}

shinyServer(function(input, output) {
   
    output$pred <- renderText(predictMPG(input$cyl, input$horse, input$weight/1000, input$trans))
      

  
})
