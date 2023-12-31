df <- readr::read_csv("owid-co2-data.csv")
head(df)
View(df2)

df2 <- df |> 
  dplyr::select(country, year, gdp, co2_per_capita, population) |> 
  dplyr::filter(country == c("Canada", "France", "Germany", "Italy", "Japan", "United Kingdom", "United States"),
                !is.na(gdp)) |> 
  dplyr::mutate(gdp_per_capita = gdp / population) |> 
  dplyr::mutate(gdp_per_capita_in_1000 = gdp_per_capita / 1000) |> 
  #dplyr::mutate(year2 = ifelse())

df2 |> 
  ggplot2::ggplot() +
  ggplot2::geom_line(ggplot2::aes(x = gdp_per_capita_in_1000, y = co2_per_capita)) +
  ggplot2::geom_point(ggplot2::aes(x = gdp_per_capita_in_1000, y = co2_per_capita)) +
  ggplot2::scale_x_log10(breaks = c(1, 2, 4, 8, 16, 32, 64), labels = c(1, 2, 4, 8, 16, 32, 64)) +
  #ggplot2::geom_label()
  ggplot2::facet_wrap(~ country) +
  ggplot2::labs(x = "gdp per capita(1000 USD)", y = "CO2 per capita") +
  ggplot2::theme_bw()
