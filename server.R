library(shiny)
library(car)
shinyServer(function(input, output) {
  values <- reactiveValues()
  observe({
    input$action_Calc
    values$int2 <- isolate({
      input$ml *
        recode(input$naputok, "1 = '0.08'; 2 = '0.40'; 3 = '0.70'") / 10 * 0.79})
    values$int3 <- isolate({
      input$ml *
        recode(input$naputok, "1 = '0.08'; 2 = '0.40'; 3 = '0.70'") * 0.79 - values$int2})
    values$int <- isolate({
      values$int3 / (input$masa * recode(input$statb, "1 = '0.70'; 2 = '0.60'"))})
    })
  output$text_int <- renderText({
    if(input$action_Calc == 0) ""
    else
    paste("Вміст алкоголю в крові:", values$int, "проміле")
  })
})