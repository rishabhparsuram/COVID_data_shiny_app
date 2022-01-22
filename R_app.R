#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  # *Input() functions,
  # *Output() functions
  selectInput(inputId = "first_country", label = "Choose the first country", choices = unique(covid_data$location), multiple = FALSE), 
  selectInput(inputId = "second_country", label = "Choose the second country", choices = unique(covid_data$location), multiple = FALSE),
  plotOutput("graph"),
  tableOutput("table")
)

server <- function(input, output) {
  output$graph <- renderPlot({
    graph_function(first_country = input$first_country, second_country = input$second_country)
  })
  output$table <- renderTable({
    metrics_comp(first_country = input$first_country, second_country = input$second_country)
  }, rownames = TRUE)
}

shinyApp(ui = ui, server = server)