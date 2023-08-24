## load libraries
library(pacman)
p_load(tidyverse,janitor)

## data cleaning
clean_names(data)
colnames(data)

## read data
art_cov <- read.csv("art_coverage_by_country_clean.csv")
View(art_cov)

## data cleaning
clean_names(art_cov)
colnames(art_cov)

art_cov1 <- art_cov |> 
  filter(reported_number_of_people_receiving_art != "Nodata", estimated_number_of_people_living_with_hiv != "Nodata")

## data wrangling
art_cov2 <- art_cov1 |>
  separate(estimated_number_of_people_living_with_hiv, sep = "[^[:alnum:]]+", into = c("estimated_number_of_people_living_with_hiv")) |> 
  separate(estimated_art_coverage_among_people_living_with_hiv, sep = "[^[:alnum:]]+", into = c("estimated_art_coverage_among_people_living_with_hiv"))
art_cov3 <- art_cov2 |> 
  mutate(estimated_number_of_people_living_with_hiv = as.numeric(estimated_number_of_people_living_with_hiv),
         reported_number_of_people_receiving_art = as.numeric(reported_number_of_people_receiving_art),
         estimated_art_coverage_among_people_living_with_hiv = as.numeric(estimated_art_coverage_among_people_living_with_hiv)
         )
glimpse(art_cov3)

## export data for data visualization/Tableau
