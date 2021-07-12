library(dygraphs)
library(readr)
library(tsbox)
library(xts)
library(dplyr)

economic_sentiment <- readr::read_csv("raw/at/economic_sentiment_sa.csv") %>%
  select(time,value) %>%
  ts_xts()

trendecon_all_sa <- read.csv("https://raw.githubusercontent.com/trendecon/data/master/data/ch/trendecon_sa.csv") %>%
  select(time,value) %>%
  ts_xts()

dygraph(economic_sentiment)

dygraph(economic_sentiment,group = "keywords")%>%
  dyAxis("x", drawGrid = FALSE)%>%
  dySeries("value", label = "Index") 
