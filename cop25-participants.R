library(tidyverse)

participants <- read_csv("data/participants.csv")

population <-
  read_csv("data/WPP2019_TotalPopulationBySex.csv") |>
  filter(Time == 2015) |>
  select(country = Location, population = PopTotal) |>
  mutate(country = str_replace(country, "'", "’"))

per_capita_summary <- participants |>
  count(delegation, sort = TRUE) |>
  left_join(population, by = c("delegation" = "country")) |>
  filter(!is.na(population)) |>
  mutate(delegates_per_capita = (n / population) * 100)

per_capita_summary |>
  ggplot(aes(delegation, delegates_per_capita)) +
  geom_bar(stat = "identity")