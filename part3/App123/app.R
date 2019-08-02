library(shiny)
ui <- fluidPage(
  # ... rest of the code
  wellPanel(
    fluidRow(
      column(3, selectInput("choices", label = h4("choose"), 
                            choices = list("fever" = "twi", "Twitter vs CDC" = "twc", "flu" = "FLU"),
                            selected = "PER"),
             uiOutput("img1")), # here is the image
      column(9, plotOutput("plot2"))
    )
  )
)

server <- function(input, output){
  # ... rest of the code
  output$img1 <- renderUI({
    if(input$choices == "twi"){            
      img(height = 500, width = 800,align = "center", src = "fever.png")
    }                                        
    else if(input$choices == "twc"){
      img(height = 800, width = 800,align = "center", src = "comp.png")
    }
    else if(input$choices == "FLU"){
      img(height = 500, width = 800, align= "center",src = "flu.png")
    }
  })
  # ... rest of the code
}


shinyApp(ui, server)
