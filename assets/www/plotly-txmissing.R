library(plotly)
library(crosstalk)
library(htmlwidgets)

sd <- SharedData$new(txhousing, ~city, "Select a city")

base <- plot_ly(sd, color = I("black"), height = 300, width = 700) %>%
  group_by(city)

p1 <- base %>%
  summarise(has = sum(is.na(median))) %>%
  filter(has > 0) %>%
  arrange(has) %>%
  add_bars(x = ~has, y = ~factor(city, levels = city), hoverinfo = "x+y") %>%
  layout(
    barmode = "overlay",
    xaxis = list(title = "Number of months missing"),
    yaxis = list(title = "")
  ) 

p2 <- base %>%
  add_lines(x = ~date, y = ~median, alpha = 0.3) %>%
  layout(xaxis = list(title = ""))

s <- subplot(p1, p2, titleX = TRUE, widths = c(0.3, 0.7)) %>% 
  layout(
    margin = list(l = 120),
    annotations = list(list(
      text = "Median house price in \n San Marcos reached $250,000 \n in late 2010",
      x = 2010.8, y = 250000, xref = "x2", yref = "y2",
      ax = -1
    ),
    list(
      text = "San Marcos is missing price information between 2001 & 2005",
    ))
  ) %>%
  hide_legend() %>%
  highlight(dynamic = TRUE, persistent = TRUE, selectize = TRUE, defaultValues = "San Marcos")

saveWidget(s, "plotly-txmissing.html", selfcontained = FALSE)