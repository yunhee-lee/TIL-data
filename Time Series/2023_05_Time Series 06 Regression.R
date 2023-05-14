rm(list = ls())
setwd("~/Work/TIL-data/Time Series")

library(readxl)
library(tidyverse)

# 교차상관도표 작성 ####
bc <- read_excel("Sample Data/데이터.xlsx", sheet = "경기종합지수")
bc_ts <- bc[, 2:3] %>% ts()
# 교차상관계수 확인 - 단기변동을 확인하기에 유용
ccf(bc_ts[, 1], bc_ts[, 2], lag = 12, main = "")
# result : 5개월 정도 선행지수가 선행하고 있는 형태

# 회귀모형의 추정 ####
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

# 더빈-왓슨 검정과 자기상관 조정 회귀모형 ####
library(car)
durbinWatsonTest(gdp_r_lm)
# result : D-W statistic은 0.6515로 양의 자기상관이 존재
# description : 1차 시차변수 gdp_r_1을 추가
gr2 <- ts.union(gdp_r, ipi_r, sbi_r, gdp_r_1 = stats::lag(gdp_r, -1))
gdp_r_lmc <- lm(gdp_r ~ ipi_r + sbi_r + gdp_r_1, data = gr2)
summary(gdp_r_lmc)
# result : r-squared 기존 모형에서 0.8217에서 수정된 모형의 경우 0.8865로 상향

# 일반화된 시계열 회귀모형을 이용한 예측
library(forecast)
fit <- auto.arima(gdp_r, xreg = cbind(ipi_r, sbi_r))
summary(fit)
checkresiduals(fit)

# description : 설명변수를 지난 4분기 평균값으로 4분기 연장한 후 앞서의 모형으로 경제성장률을 4분기 예측
xreg <- cbind(rep(mean(ipi_r[87:90], 4)), rep(mean(sbi_r[87:90], 4)))
colnames(xreg) <- colnames(fit$xreg)
fcast<- forecast(fit, xreg = xreg, h = 4)
plot(fcast, main = "")
