# AR(p) 모델의 파라미터 선택 ####
demand <- read.table("~/Work/TIL-data/Time Series/Sample Data/Daily_Demand_Forecasting_Orders.csv", sep=";", header=TRUE , quote="")
fit <- ar(demand[["Banking.orders..2."]], method = "mle")
fit

est <- arima(x = demand[["Banking.orders..2."]]
             , order=c(3, 0, 0)
             , fixed=c(0, NA, NA, NA))
est

# 성능 검사
acf(est$residuals)
Box.test(est$residuals, lag=10, type="Ljung", fitdf=3)

# AR(p) 과정으로 예측하기 ####
require(forecast)
plot(demand[["Banking.orders..2."]], type='l')
# fitted는 모델 적합에 사용된 데이터에 대한 예측값 반환
# 예측 기간 지정을 위한 h 인수 추가 전달 가능
lines(fitted(est), col=3, lwd=2)
lines(fitted(est, h=3), col=4, lwd=3)
lines(fitted(est, h=10), col=2, lwd=1)
