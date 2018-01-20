##  The chosen order of the polynomial is passed to this
##  server function and is used to calculate the
##  corresponding 10-fold cross-validation error.  This
##  is then passed back to the ui.R where it is displayed
##  next to the slider.


library(shiny)
library(stats)
library(ISLR)
library(boot)

# Define server code required to produce model
shinyServer(function(input, output) {

  cverr <- reactive({
    set.seed(17)
    glm.fit <- glm(mpg~poly(horsepower, input$poly),data=Auto)
  cv.glm(Auto, glm.fit, K=10)$delta[1]
  })  
  output$cverr <- renderText(cverr())
  
})
