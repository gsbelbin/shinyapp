##  User interface to see the effect of changing the order
##  of a polynomial which is being used for a fit mpg as
##  a function of horsepower in the Auto data set in the
##  ISLR package.  
##  Altering the order of the polynomial is reflected in
##  a change in the cross-validation error when using
##  10-fold cross-validation.  The order is altered using
##  the slider and the error is calculated in server.R.
##  The error is displayed next to the slider.

library(shiny)

# 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("K-Fold Cross Validation Demonstration"),

  # Sidebar with a slider input for order of polynomial 
  sidebarLayout(
    sidebarPanel(
       sliderInput("poly",
                   "Order of polynomial:",
                   min = 1,
                   max = 10,
                   value = 2)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("Altering the slider on the left sets the order of the polynomial which is used to fit mpg to horsepower in the Auto data set."),
      h5("Cross Validation Error:"),
       textOutput("cverr")
    )
  )
))
