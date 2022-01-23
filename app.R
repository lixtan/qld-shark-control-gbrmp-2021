library(shiny)
library(dplyr)
library(DT)
library(ggplot2)
library(shinydashboard)
library(plotly)
library(shinythemes)

catches2021 <- read.csv("../gbrmp-catch-statistics-2021.csv")

ui <- navbarPage("Queensland Shark Program 2021 Catches - Great Barrier Reef Marine Park",
    tabPanel("About", fluidPage(theme = shinytheme("united")),
                       p("This Shiny dashboard provides summary statistics about the catches 
                       in the Queensland Shark program at the Great Barrier Reef Marine Park 
                       in 2021. Catch details include: species, date, area, location, fate and 
                       number. The data was obtained from", 
                       a("Queensland's Open Data Portal.", href="https://www.data.qld.gov.au/dataset/qld-shark-control-program-catch-statistics-great-barrier-reef-marine-park", target="_blank"),
                       hr(),"Created by",a("Li X Tan",href="https://www.github.com/lixtan/", target="_blank")
                       ,style = "font-size:25px")),
    tabPanel("Summary Statistics",
             tags$head(
              tags$style(HTML(".shiny-output-error-validation{color: red;}"))),
        pageWithSidebar(
        headerPanel('Apply filters'),
        sidebarPanel(width = 4,
                     selectInput('player', 'Choose a player:',paste(data$player,"-",data$team))
        ),
        mainPanel(
          column(8, plotlyOutput("plot1", width = 800, height=700),
                 p("To visualize the graph of the player, click the icon at side of names 
             in the graphic legend. It is worth noting that graphics will be overlapped.",
                   style = "font-size:25px")
                 
          )
        )
      ))
    )

server <- function(input, output, session) {
  output$plot1 <- renderPlotly({})
}

shinyApp(ui = ui, server = server)