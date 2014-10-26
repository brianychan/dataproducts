##  ui.R - Prediction App

library(shiny)
shinyUI(
    pageWithSidebar(
    
    #Title
    headerPanel("Pitching Metrics Calulator"),
    
    #Inputs
    sidebarPanel(
        p(h5("Enter the pitcher's statistics for the game and hit 'Submit' to calculate the metrics.")),
        numericInput('outs','Outs Recorded',1,min=0,max=5000,step=1),
        numericInput('runs','Earned Runs',0,min=0,max=5000,step=1),        
        numericInput('hits','Hits Allowed',0,min=0,max=5000,step=1),
        numericInput('bb','Base on Balls',0,min=0,max=5000,step=1),
        numericInput('k','Strike-outs',0,min=0,max=5000,step=1),
        numericInput('pitches','Pitches Thrown',0,min=0,max=5000,step=1),
        submitButton('Submit'),
        br(),
        img(src="baseball.jpg")
    ),
    
    #Outputs
    mainPanel(
        h3('Results'),
        h4('Innings pitched:'),
        verbatimTextOutput("innings"),
        h4('Earned Run Average:'),
        h5('Total runs allowed per 9 innings'),
        verbatimTextOutput("era"),
        h4('WHIP:'),
        h5('Total walks and hits allowed per inning'),
        verbatimTextOutput("whip"),
        h4('Power Finesse Ratio:'),
        h5('Total strike-outs and walks allowed per inning'),
        verbatimTextOutput("pfr"),
        h4('Was this a Quality Start?'),
        h5('Quality start is an appearance of at least 6 innings, while allowing no more than 3 runs.'),
        verbatimTextOutput("qualitystart")
    )
))