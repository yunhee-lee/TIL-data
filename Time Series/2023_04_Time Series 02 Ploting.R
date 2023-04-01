# install.packages("readxl"); install.packages("zoo")
setwd("~/Work/TIL-data/Time Series")
rm(list = ls())

library(readxl)
library(zoo)

gdp <- read_excel("./Sample Data/데이터.xlsx", sheet = "GDP")
date_q <- seq(as.Date("1960-01-01"), as.Date("2022-04-01"), "quarter")
gdp_zoo <- zoo(gdp[, 2:3], date_q)
head(gdp_zoo)
tail(gdp_zoo)

plot(gdp_zoo/1000, screens = 1, col = c(2, 1), ylab = "GDP(조 원)", xlab = "")
legend("topleft", col = c(1, 2), lty = 1, c("원계열", "계절조정계열"), bty = "n")
