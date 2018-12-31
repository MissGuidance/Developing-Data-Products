#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
      shinyServer(function(input, output) {
            mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg - 20, 0)
            model1 <- lm(drat ~ mpg, data = mtcars)
            
            model1pred <- reactive({
                  mpgInput <- input$sliderMPG
                  predict(model1, newdata = data.frame(mpg = mpgInput))
            })
            
            output$plot1 <- renderPlot({
                  mpgInput <- input$sliderMPG
                  
                  plot(mtcars$mpg, mtcars$drat, xlab = "Miles Per Gallon", 
                       ylab = "Rear Axle Ratio", bty = "n", pch = 16,
                       xlim = c(10, 35), ylim = c(2, 5))
                  if(input$showModel1){
                        abline(model1, col = "red", lwd = 2)
                  }
                  
                  legend(25, 250, c("Model 1 Prediction"), pch = 16, 
                         col = "red", bty = "n", cex = 1.2)
                  points(mpgInput, model1pred(), col = "red", pch = 16, cex = 2)
                 
            })
            
            output$pred1 <- renderText({
                  model1pred()
            })
            
            
      })   
  