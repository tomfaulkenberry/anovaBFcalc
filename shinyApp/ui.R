library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("BF calculator for single-factor ANOVA summaries"),
  
  sidebarPanel(
    
    numericInput(inputId = "F",
                label = "F-statistic:",
                value = 1,
                min = 0,
                max = 1e5,
                step=0.1
                ),
    
    numericInput(inputId = "df1",
                 label = "df1:",
                 value = 1,
                 min = 1,
                 max = 10
    ),
    
    numericInput(inputId = "df2",
                 label = "df2:",
                 value = 1,
                 min = 1,
                 max = 100
    ),
    
    radioButtons(inputId = "repeated",
                label = "Design:",
                choiceNames = c("Between-subjects","Repeated-measures"),
                choiceValues = c("bet","rep")
                ),
    
    numericInput(inputId = "pH0",
                 label = "Prior probability of null:",
                 value=0.5,
                 min=0,
                 max=1,
                 step=0.1
    ),
    
    br(),
    br(),
    p("Designed by ", a("Tom Faulkenberry",href="http://tomfaulkenberry.github.io"), "based on methods described ", a("here",href="https://doi.org/10.2478/bile-2018-0003"), " and ", a("here", href="https://doi.org/10.1016/j.jmp.2015.03.003")),
    p("For source code, vist my ", a("Github page", href="http://github.com/tomfaulkenberry/anovaBFcalc"))
    
  
  ),
  
  mainPanel(
    fluidPage(
      title = 'Model definitions',
      withMathJax(),
      div(helpText('Model definitions:'), align = "left", style="font-size:130%"),
      div(helpText('\\(\\mathcal{H}_0:\\) all condition means are equal'), style="font-size:130%"),
      div(helpText('\\(\\mathcal{H}_1:\\) not all condition means are equal'), style="font-size:130%")
    ),
    
    plotOutput("pizza"),
    div(helpText('Bayes factors:'), style="font-size:140%"),
    div(textOutput("bfNull"), align = "left", style="font-size:130%;"),
    div(textOutput("bfAlt"), align = "left", style="font-size:130%"),
    div(textOutput("description"), align = "left", style="font-size:130%"),
    br(),
    div(helpText('Posterior probabilities:'), style="font-size:140%"),
    div(textOutput("postNull"), align = "left", style="font-size:130%;"),
    div(textOutput("postAlt"), align = "left", style="font-size:130%")
    
  )
))