library(dygraphs)
library(readr)
library(tsbox)
library(xts)
library(dplyr)

economic_sentiment <- readr::read_csv("../gsv_data/data/at") %>%
  select(time,value) %>%
  ts_xts()

trendecon_all_sa <- read.csv("https://raw.githubusercontent.com/trendecon/data/master/data/ch/trendecon_sa.csv") %>%
  select(time,value) %>%
  ts_xts()

library(ggplot2)
autoplot(trendecon_all_sa)
ggsave("../gsv_ma_thesis/figures")


dygraph(economic_sentiment)

dygraph(economic_sentiment,group = "keywords")%>%
  dyAxis("x", drawGrid = FALSE)%>%
  dySeries("value", label = "Index") 
