#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
      titlePanel("Predict Rear Axle Ratio from MPG"),
      sidebarLayout(
            sidebarPanel(
                  sliderInput("sliderMPG", "Select your MPG?", 10, 35, value = 20),
                  checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE)
                  
            ),
            mainPanel(
                  plotOutput("plot1"),
                  h3("Predicted Rear Axle ratio from Model 1:"),
                  textOutput("pred1")
            )
      )
))