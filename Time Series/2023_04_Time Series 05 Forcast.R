rm(list = ls())
setwd("~/Work/TIL-data/Time Series")

library(readxl); library(tseries)
library(tidyr); library(tidyverse); library(ggplot2)
library(forecast)


# description : 계절조정 GDP의 단위근검정 ####
cpi <- read_excel("Sample Data/데이터.xlsx", sheet = "소비자물가")
cpi_ts <- cpi[, 3] %>% ts(start = 1985, frequency = 12)

cpi_ts %>% log() %>% adf.test()
cpi_ts %>% log() %>% diff() %>% adf.test()
# result : 단위근 검정 시행 결과 (1차) log 변환 CPI는 단위근을 가지고 있고,
# (2차) log 변환 후 차분까지 진행한 CPI 계열은 ADF 검정결과 귀무가설을 기각하여 단위근을 가지고 있지 않은 안정 시계열임


# description : 로그변환된 월별 종합주가지수에 대한 ARIMA 모형의 작성 ####
kospi <- read_excel("Sample Data/데이터.xlsx", sheet = "주가지수")
kospi_ts <- kospi[, 2] %>% ts(start = 2004, frequency = 12) %>% window(start = 2010)

kospi_ts %>% log %>% ggtsdisplay(main = "", theme = theme_bw())
kospi_ts %>% log %>% diff %>% ggtsdisplay(main = "", theme = theme_bw())
# description : ggtsdisplay 함수를 이용하여 상관도표와 부분상관도표를 작성

kospi_ts %>% log %>% Arima(order = c(1, 1, 1))
kospi_ts %>% log %>% auto.arima(seasonal = FALSE)
# description : auto.arima로 자동으로 모형을 선정
# result : 선정 결과 ARIMA(1, 1, 1) 모형이 채택됨

# description : ARIMA 모형의 과대적합 검토
kospi_ts %>% log %>% Arima(order = c(1, 1, 1))
kospi_ts %>% log %>% Arima(order = c(2, 1, 1))
kospi_ts %>% log %>% Arima(order = c(1, 1, 2))
# result : 세 모형을 비교한 결과 ARIMA(1, 1, 1) 모형의 AIC와 BIC가 모두 가장 낮음

# description : ARIMA 모형의 진단
kospi_ts %>% log %>% Arima(order = c(1, 1, 1)) %>%
  checkresiduals(main = "", theme = theme_bw())
# result : (1) 표준화된 잔차가 패턴을 보이는지? (2) 잔차의 상관도표 상에 자기상관계수가 점선 내에 있는지?
# (3) 잔차가 정규분포(종 모양)를 따르는지?

# description : ARIMA 모형의 예측
kospi_ts %>% log  %>% Arima(order = c(1, 1, 1)) %>%
  forecast(h = 12) %>% plot(main = "")


