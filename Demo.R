df <- readr::read_csv("owid-co2-data.csv")
head(df)
View(df)

df |> 
  dplyr::select(country, year, gdp, co2_per_capita, population) |> 
  dplyr::filter(country == c("Canada", "France", "Germany", "Italy", "Japan", "United Kingdom", "United States")) |> 
