library(shiny)
library(ggplot2)
## Stuff here gets run once upon opening

shinyServer(
      function(input, output) {
            f <- function(a,b,x) {
                  a + b * x }
            output$intercept <- renderText({f(input$a, input$b, input$z)})
            output$slope <- renderText({f(input$c, input$d, input$z)})
            
            e <- function(a,b,c,d,z,x) {
                  exp((a + b*z) + (c + d*z)*x)/(1+exp((a + b*z) + (c + d*z)*x)) }
            output$plot<- renderPlot({ 
                  g <- ggplot( data.frame(x=c(-20,20)), aes(x)) +
                        stat_function(fun=function(x) e(input$a, input$b, input$c, input$d, input$z, x)) +
                        coord_cartesian(xlim=c(-20,20),ylim=c(-.1,1.1)) +
                        labs(title='log(odds) = a + b*Z + X(c + d*Z)')
                  print(g)})

      }
)
            
            # ## Testing
            # # y = a + x(b+cz) + dz
            # b <- 2
            # c <- -2
            # d <- 1
            # z <- 2
            # a <- 0
            # int <- a + d*z
            # slp <- b + c*z
            # manipulate( {ggplot(data.frame(x=c(-20,20)), aes(x)) +
            #       stat_function(fun=function(x) exp((a + d*z) + (b + c*z)*x)/(1+exp((a + d*z) + (b + c*z)*x))) +
            #             coord_cartesian(xlim=c(-20,20),ylim=c(-.1,1.1)) +
            #             labs(title='Y = a+dz + x(b+cz)')},
            #       d=slider(-2,2,step=.1,initial=0), z=slider(-2,2,step=.1,initial=0), c=slider(-2,2,step=.1,initial=0),b=slider(-2,2,step=.1,initial=0))
            