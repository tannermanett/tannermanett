library(datasets)  # Load base packages manually
library(tidyverse)
library(dplyr)

#Pythagorean Expectation
estimate_winning <- Hockey_Pythag_Therorem_ %>%
  select(Team, W, L, GF, GA) %>%
  filter(Team != "Seattle Kraken") %>%
  mutate(Predict = (GF^2.3)/(GF^2.3 + GA^2.3), Actual = (W/207.5), Error = abs(Predict-Actual)) %>%
  arrange(desc(Predict))

estimate_winning

#Average MAD for exp=2.3 (Most accurate exponent)
mean(estimate_winning$Error)

#-------------------------------------------------------------#
#Measures of Spread

#Spread of points 
quantile(Hockey_Pythag_Therorem_$`W`)

# Load necessary libraries
library(ggplot2)
library(hexbin)

  library(datasets)  # Load base packages manually

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, rio) 

"C:\Users\tmane\OneDrive\Desktop\shots_2021 (2)\shots_2021.csv"

rio_csv <- import("/Users/tmane/OneDrive/Desktop/shots_2021 (2)/shots_2021.csv")
head(rio_csv)

# Create a data frame with the coordinates of Ovechkin's shots
shots <- rio_csv %>%
  filter(goalieNameForShot == 'Jack Campbell', event == 'GOAL')
head(shots)

# Plot the coordinates of Ovechkin's shots as a heat map
ggplot(shots, aes(x = arenaAdjustedXCord, y = arenaAdjustedYCord)) +
  geom_hex() +
  labs(
    title = "Ovechkin's Goals",
    x = "X Coordinate",
    y = "Y Coordinate"
  )

