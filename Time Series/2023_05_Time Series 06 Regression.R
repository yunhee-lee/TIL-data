rm(list = ls())
setwd("~/Work/TIL-data/Time Series")

library(readxl)
library(tidyverse)

bc <- read_excel("Sample Data/데이터.xlsx", sheet = "경기종합지수")
bc_ts <- bc[, 2:3] %>% ts()
# 교차상관계수 확인 - 단기변동을 확인하기에 유용
ccf(bc_ts[, 1], bc_ts[, 2], lag = 12, main = "")
# result : 5개월 정도 선행지수가 선행하고 있는 형태

gdpf <- read_excel("Sample Data/데이터.xlsx", sheet = "GDP예측")
gdpf_ts <- gdpf[, 2:7] %>% ts(start = 2000, frequency = 4)
gdp_r <- gdpf_ts[, 4]
ipi_r <- gdpf_ts[, 5]
sbi_r <- gdpf_ts[, 6]
gr1 <- ts.union(gdp_r, ipi_r, sbi_r)
plot(gr1, main = "", xlab = "", col = "steelblue")

gdp_r_lm <- lm(gdp_r ~ ipi_r + sbi_r, data = gr1)
summary(gdp_r_lm)
# result : 회귀계수, t 값, 유의확률 확인

plot(gdp_r, col = "steelblue", ylim = c(-2, 10), ylab = "", xlab = "")
lines(ts(predict(gdp_r_lm), start = c(2001, 1), freq = 4), col = 2)
legend("topright", col = c(1, 2), lty = 1, c("GDP Growth", "Predictions"), bty = "n")
