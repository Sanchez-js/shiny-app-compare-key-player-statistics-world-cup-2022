#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("World Cup Top Performers Stats"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId ="VarX",label= "Select x-axis variable:", choices=names(numeric_table)),
        selectInput(inputId ="VarY",label= "Select y-axis variable:", choices=names(numeric_table)),
    ),
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)
        
            


# Define server logic required to draw a histogram
server <- function(input, output) {

  output$scatterplot <- renderPlot({
    scatter<-numeric_table[,c(input$VarX, input$VarY)]
    plot(scatter[,1],scatter[,2],
         xlab=colnames(scatter)[1],
         ylab=colnames(scatter)[2],
         main= paste("Scatter Plot of ", input$VarX, "VS", input$VarY),
          col="violet", pch=15)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
