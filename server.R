library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(leaflet)
library(plotly)
library(knitr)

emissions_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
write.csv(emissions_data, file = "owid-co2-data.csv")

## My 3 values for the introduction page

# What country has the lowest oil CO2 emissions in the most recent year?
highest_oil_co2_emissions <- emissions_data %>% 
  filter(year == max(year)) %>%
  filter(oil_co2 == min(oil_co2, na.rm = TRUE)) %>% 
  pull(country)
  
# What year has the highest oil CO2 emissions globally?
global_high_co2_emissions <- emissions_data %>% 
  group_by(year) %>% 
  summarize(total_oil_co2 = sum(oil_co2, na.rm = T)) %>% 
  filter(total_oil_co2 == max(total_oil_co2)) %>% 
  pull(year)

# What is the average oil CO2 emissions total across the world in the most recent year?
global_low_co2_emissions <- emissions_data %>% 
  filter(year == max(year)) %>% 
  summarize(average_oil_co2 = mean(oil_co2, na.rm = T)) %>% 
  pull(average_oil_co2)
## ~~ trying to fix emissions dataset

emissions_data_oil_co2 <- emissions_data %>% 
  summarize(country, year, oil_co2) %>% 
  subset(country != "World")

## Data Wrangling
world_shape <- map_data("world") %>% 
  rename(country = region)


# server function

