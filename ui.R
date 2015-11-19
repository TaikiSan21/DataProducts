library(shiny)

shinyUI( fluidPage(
      title = 'Visualising Interaction Terms in Logistic Regression',
      h1('Visualising the Effect of Interaction Terms in Logistic Regression'),
      plotOutput('plot'),
      hr(),
      fluidRow(
            column(6, 
                   h3('Function: log(odds) = a+bZ + X(c+dZ)'),
                   fluidRow(
                         column(4,h5('Intercept Coefficients'),
                                sliderInput('a','a',min=-2,max=2,value=0,step=0.1)),
                         column(4,h5('Slope Coefficients'),
                                sliderInput('c','c',min=-2,max=2,value=0.5,step=0.1))),
                   fluidRow(
                         column(4, offset = 2,
                                sliderInput('z','Z Value',min=-2,max=2,value=0,step=0.1))),
                   fluidRow(
                         column(4,
                                sliderInput('b','b',min=-2,max=2,value=0,step=0.1)),
                         column(4,
                                sliderInput('d','d',min=-2,max=2,value=0.5,step=0.1)))),
            column(4,
                   h3('Outputs'),
                   br(),
                   h4('Intercept a+bZ:'),
                   textOutput('intercept'),
                   br(),
                   h4('Slope c+dZ:'),
                   textOutput('slope'),
                   br(),
                   h4('Instructions:'),
                   p('Adjust the sliders to the left to alter the equation parameters and the graph will adjust accordingly.'),
                   p('The intercept and slope values shown are the intercept and slope in the log odds function for a logistic regression.')))
))



      