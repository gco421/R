library(shiny)
library(r2d3)

ui <- fluidPage(
  inputPanel(
    sliderInput("bar_max", label = "Max:",
                min = 4, max = 8, value = 1, step = 0.1)
  ),
  d3Output("d3")
)

sampledata = read.csv(file="graphFile.csv")

server <- function(input, output) {
  output$d3 <- renderD3({
    r2d3(
      subset(sampledata, Sepal_Length >= input$bar_max),
      script = "pnetwk.js"
    )
  })
}

shinyApp(ui = ui, server = server)

