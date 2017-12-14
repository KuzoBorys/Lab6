library(shiny)
shinyUI(fluidPage(
  titlePanel("Концентрація алкоголю в крові"),
  sidebarLayout(
    sidebarPanel(
      numericInput("ml", label = h6("Введіть кількість випитого: "), value = 200),
      numericInput("masa", label = h6("Введіть масу тіла: "), value = 60),
      selectInput("naputok", label = h6("Виберіть напиток"), choices = list("Пиво" = 1, "Водка" = 2, "Абсент" = 3), selected = 2),
      selectInput("statb", label = h6("Виберіть стать"), choices = list("Чоловік" = 1, "Жінка" = 2), selected = 1),
      actionButton("action_Calc", label = "РОЗРАХУВАТИ")),
    mainPanel("",p(h5("")), textOutput("text_int")))))