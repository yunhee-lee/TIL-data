setwd("~/Work/TIL-data/Time Series")
rm(list = ls())

library(forecast)
library(ggplot2)
library(readxl)

set.seed(1225)
nn <- 52 * 4
wn <- ts(rnorm(nn), start = 1970, frequency = 4)

plot(wn, main = "", xlab = "", ylab = "White Noise", col = "steelblue")
abline(h = 0, lty = 2, col = "gray")

acf(wn, main = "", col = "steelblue", xlab = "")
pacf(wn, main = "", col = "steelblue", xlab = "")

Box.test(wn, lag = 8, type = "Ljung")
wn %>% ggtsdisplay(main = "", theme = theme_bw())

gdp <- read_excel("./Sample Data/데이터.xlsx", sheet = "GDP")
gdp_ts <- ts(gdp[, 3]/1000, start = 1960, frequency = 4)
dlgdp_ts <- window(diff(log(gdp_ts)), start = 2000)
dlgdp_ts %>% ggtsdisplay(main = "", theme = theme_bw())
