df <- readr::read_csv("owid-co2-data.csv")
head(df)
View(df2)

df2 <- df |> 
  dplyr::select(country, year, gdp, co2_per_capita, population) |> 
  dplyr::filter(country == c("Canada", "France", "Germany", "Italy", "Japan", "United Kingdom", "United States"),
                !is.na(gdp)) |> 
  dplyr::mutate(gdp_per_capita = gdp / population)

df2 |> 
  ggplot2::ggplot() +
  ggplot2::geom_line(ggplot2::aes(x = year))
