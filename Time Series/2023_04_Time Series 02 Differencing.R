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

# 위에서 사용한 zoo() function과 유사한 역할을 수행
gdp_ts <- ts(gdp[, 2:3]/1000, start = 1960, frequency = 4)
# 1차 차분
dlgdp_1 <- diff(log(gdp_ts[, 2]))
# 4차 차분
dlgdp_4 <- diff(log(gdp_ts[, 2]), 4)

dlgdp <- cbind(dlgdp_1, dlgdp_4)
spectrum(na.omit(dlgdp), spans = c(3, 3), col = c("red", "steelblue"), main = "", lty = c(20, 1), lwd = 1.5)
legend("topright", col = c("red", "steelblue"), lty = c(20, 1), lwd = 1.5,
       c("1st differences", "4th differences"), bty = "n")
# spans option 통해 이중이동평균을 적용한 것을 확인할 수 있음
