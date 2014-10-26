## server.R - Prediction App

library(shiny)

innings <- function(outs) {outs/3} 
era <- function(outs,runs) {runs*9/(outs/3)}
whip <- function(bb,hits,outs) {(bb+hits)/(outs/3)}
pfr <- function(k,bb,outs){(k+bb)/(outs/3)}
qualitystart <- function(outs,runs){
    if(runs<=3 & outs >=18){"Yes"
    } else {
        "No"
    }
}

shinyServer(
    function(input,output){
        output$innings <- renderPrint({innings(input$outs)})
        output$era <- renderPrint({era(input$outs,input$runs)})
        output$whip <- renderPrint({whip(input$bb,input$hits,input$outs)})
        output$pfr <- renderPrint({pfr(input$k,input$bb,input$outs)})
        output$qualitystart <- renderPrint({qualitystart(input$outs,input$runs)})
    }
)