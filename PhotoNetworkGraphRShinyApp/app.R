library(shiny)
library(r2d3)
library(rjson)

ui <- fluidPage(
  inputPanel(
    sliderInput("bar_max", label = "Max:",
                min = 4, max = 8, value = 1, step = 0.1)
  ),
  d3Output("d3")
)

# Import data from json file
myJson = JsonData <- fromJSON(file= "graphFile.json" )

server <- function(input, output) {
  output$d3 <- renderD3({
    r2d3(
      data = myJson,
      script = "pnetwk.js", 
      css = "style.css"
    )
  })
}

shinyApp(ui, server)


