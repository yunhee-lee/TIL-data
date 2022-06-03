# mts dataset 탐색 ----
# source) Practical Time Series Analysis
head(EuStockMarkets)
plot(EuStockMarkets)
class(EuStockMarkets) # mts (multi variate time seires)
frequency(EuStockMarkets) # 데이터의 연간 빈도를 알 수 있음

start(EuStockMarkets)
end(EuStockMarkets)

# 데이터에서 시간의 한 부분 범위를 얻기
window(EuStockMarkets, start=1997, end=1998)

# 히스토그램 ----
hist(EuStockMarkets[, "SMI"], 30)
hist(diff(EuStockMarkets[, "SMI"], 30))

# 산점도 ----
plot(EuStockMarkets[, "SMI"], EuStockMarkets[, "DAX"])
plot(diff(EuStockMarkets[, "SMI"]), diff(EuStockMarkets[, "DAX"]))
# 한 주가 변동으로 다른 주가 변동을 예측하기 위한 시간 축 조정
plot(diff(lag(EuStockMarkets[, "SMI"]), 1), 
     diff(EuStockMarkets[, "DAX"]))

# Rolling Window ----
x <- rnorm(n=100, mean=0, sd=10) + 1 : 100
# rep 함수로 1/n 값을 n번 반복하는 배열 생성
mn <- function(n) rep(1/n, n)
plot(x, type='l', lwd=1)
# filter() 함수로 롤링 평균을 계산
lines(filter(x, mn(5)), col=2, lwd=3, lty=2)
lines(filter(x, mn(50)), col=3, lwd=3, lty=3)

# 기능을 좀 더 '사용자 정의'하여 사용 - zoo packages
library(zoo)
require(zoo)
# x를 zoo 객체로 만들어서 각 데이터를 인덱싱
# rollapply 함수는 데이터, 윈도 크기, 적용 함수, 롤링 적용 정렬 방향,
# 윈도 크기만큼 데이터가 없어도 적용할 것인지 등에 대한 인수 지정
f1 <- rollapply(zoo(x), 20, function(w) min(w), align="left", partial=TRUE)
f2 <- rollapply(zoo(x), 20, function(w) min(w), align="right", partial=TRUE)
plot(x, lwd=1, type='l')
# 좌측 정렬은 미래의 사건을 보여주지만,
lines(f1, col=2, lwd=3, lty=2)
# 우측 정렬은 과거 사건만 보여줌
lines(f2, col=3, lwe=3, lty=3)

# autocorrelation ----
x <- 1:100
y <- sin(x * pi / 3)
plot(y, type="b")
acf(y)
