shinyServer(function(input, output) { 
  
  # get input and calculate Bayes factor
  
  values = reactiveValues()
  
  observe({
    if (input$repeated == "bet"){
      values$BF01 <- anovaBFcalc::bf_bic(F=input$F, df1=input$df1, df2=input$df2, repeated=FALSE, report.as="BF01")
    }
    else {
      values$BF01 <- anovaBFcalc::bf_bic(F=input$F, df1=input$df1, df2=input$df2, repeated=TRUE, report.as="BF01")
    }
    values$pOdds = input$pH0/(1-input$pH0)
  })
  
 
  # render outputs (plot and text)
  
  # Output 1 - bayes factor "pizza" plot
  output$pizza <- renderPlot({
 
    xPos = 0.25
    yPos = 0.75
    radius = 0.12
    A = pi*radius^2
    alpha = 2/(1/values$BF01+1)*A/radius^2
    startpos = pi/2 - alpha/2
    plotrix::floating.pie(xPos,yPos,c(values$BF01,1),radius=radius,col=c("#4F2D7F","white"),lwd=2,startpos=startpos)
    text(xPos, yPos+1.2*radius, "data|H0", cex=1.5, font=2)
    text(xPos, yPos-1.22*radius, "data|H1", cex=1.5, font=2)
    },
    width=800,
    height=800
    )
  
  # Output 2 - text describing Bayes factor
  output$bfNull <- renderText({
    sprintf("The Bayes factor for the null is %.2f", values$BF01)
  })
  
  output$bfAlt <- renderText({
    sprintf("The Bayes factor for the alternative is %.2f", 1/values$BF01)
  })
  
  output$description <- renderText({
    if(values$BF01 > 1){
      sprintf("The observed data is approximately %.2f times more likely under the null than the alternative", values$BF01)
      }
    else{
      sprintf("The observed data is approximately %.2f times more likely under the alternative than the null", 1/values$BF01)
      
      }
    })
    
  # Output 3 - text describing posterior probabilities
  output$postNull <- renderText({
    sprintf("The posterior probability for the null is %.4f", (values$BF01*values$pOdds)/(1+(values$BF01*values$pOdds)))
  })
  
  output$postAlt <- renderText({
    sprintf("The posterior probability for the alternative is %.4f", 1-(values$BF01*values$pOdds)/(1+(values$BF01*values$pOdds)))
  })
  
    
  }
)