library(shiny)
library(shinythemes)
library(plotly)
library(leaflet)
library(tidyverse)

introduction <- tabPanel(
  "Introduction",
  titlePanel("Global CO2 Emissions from Oil"),
  p("In this project, I wanted to focus on the CO2 emissions from oil and gas that 
    was produced by different countries across the years. I found that the country
    with the lowest CO2 emissions from oil was", em("Tuvalu"), ""),
)

interactive_visualization_pg <- tabPanel(
  "Map of Global CO2 Emissions From Oil",
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "",
        label = "",
        choices = c(""),
        selected = ""
      ),
    ),
    mainPanel(
      h3("Map of Global CO2 Oil Emissions"),
      plotlyOutput(""),
      p("")
    )
  )
)

ui <- navbarPage(
  theme = shinytheme("sandstone"),
  "Oil CO2 Emissions",
  introduction,
  interactive_visualization_pg
)

