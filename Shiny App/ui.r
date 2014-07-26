library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Distributions"),
    sidebarPanel(
      radioButtons("dist", "Distribution type:",
                   c("Normal"     =   "norm",
                     "Uniform"    =   "unif",
                     "Log-normal" =   "lnorm",
                     "Logistic"   =   "logis",
                     "Exponential"=   "exp")),
      br(),  
      numericInput("n", label = "Number of observations:", value = 100, min = 1, max = 1000),
      submitButton("Apply Changes"),
      
      br(), 
      h3('Documentation'), 
      p('This app illustrate the distribution types like'), 
      code('rnorm'), code('runif'), code('rlnorm'), code('rlogis'), code('rexp'), 
      p('Following steps will guide you through the process:'),
      p('1. Select any one distrubution from the list of 5 given above'),
      #                            code('numericInput("n", label = "Number of observations:", value = 100, min = 1, max = 1000)'),
      p('2. Enter the size of distribution in the num box provided (minimum value = 1, and maximum value = 1000)'),
      #                            code('submitButton("Apply Changes")'),
      p('3. Press the apply changes button for updating the plot and data'),
      p(' '),
      p('Right side (Main Panel) consists of two tabs, 
        one for Plot and summary of the selected distribution and
        another one to display the data through which plot is generated.')
    ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot and Summary", verbatimTextOutput("summary"), plotOutput("plot")),
                  tabPanel("Data", tableOutput("table"))
    )
  )
))