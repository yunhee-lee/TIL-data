market = read.table("~/Work/TIL-data/Regression Model/Sample Data/reg2020/market-1.txt", header=TRUE)
head(market)

# Scatter Plot ####
plot(market$X, market$Y, xlab="광고료", ylab="총판매액", pch=19)
title("광고료와 판매액의 산점도")

# Linear Regression ####
market.lm = lm(Y ~ X, data=market)
summary(market.lm)

# Abline ####
plot(market$X, market$Y, xlab="광고료", ylab="총판매액", pch=19)
title("광고료와 판매액의 산점도")
abline(market.lm)
identify(market$X, market$Y) # 관심 있는 관찰 값의 정보를 확인

# Residual ####
names(market.lm) # 변수 이름 확인
resid = market.lm$residuals
fitted = market.lm$fitted
# 잔차의 합이 0임을 확인 (실제 0에 매우 근접)
sum(resid)
# 추정값과 관찰값의 합 동일
sum(fitted)
sum(market$Y)
# 잔차들의 Xi에 의한 가중합은 0
sum(market$X*resid)
# 잔차들의 Yi에 의한 가중합은 0
sum(fitted*resid)
# X와 Y의 평균은 회귀선상에 위치함
plot(market$X, market$Y, xlab="AD Charge", ylab="Total Sales", pch=19)
abline(market.lm)
xbar = mean(market$X)
ybar = mean(market$Y)
points(xbar, ybar, pch=17, cex=2.0, col="RED")
text(xbar, ybar, "(8.85, 19.36)")
fx <- "Y-hat = 0.328+2.14X"
text(locator(1), fx)

# Anova ####
market.lm = lm(Y ~ X, data=market)
anova(market.lm)

# Estimation and Test ####
# Confidence interval of coefficient
market.lm = lm(Y ~ X, data=market)
summary(market.lm)
q.val = qt(0.975, 8)
# +/- t-value times standard error
ci_from <- 2.6087-q.val*0.3874
ci_to <- 2.6087+q.val*0.3874
# Confidence interval of Y
pred.frame = data.frame(X=seq(3.5, 14.5, 0.2))
pc = predict(market.lm, int="c", newdata=pred.frame) # 기대값 신뢰구간
pp = predict(market.lm, int="p", newdata=pred.frame) # 새로운 값 신뢰구간
head(pc, 3)
head(pp, 3)
# 신뢰대 그리기
pred.X = pred.frame$X
plot(market$X, market$Y, ylim=range(market$Y, pp))
matlines(pred.X, pc, lty=c(1, 2, 2), col="BLUE") # lty 1 : 점선, 2 : 실선
matlines(pred.X, pp, lty=c(1, 3, 3), col="RED")
# pp의 신뢰대가 pc의 신뢰대보다 더 넓은 영역을 차지

# Weighted Regression ####
x = c(1, 2, 3, 4, 5)
y = c(2, 3, 5, 8, 7)
w = 1/x
w.lm = lm(y ~ x, weights=w)
summary(w.lm)
anova(w.lm)



# Practice - Simple Linear Regression ####
super = read.table("~/Work/TIL-data/Regression Model/Sample Data/reg2020/market-1.txt", header=TRUE, row.names="NUMBER")
head(super)
attach(super) # Dataset의 변수명을 직접 사용
plot(X, Y, pch=19)
super.lm = lm(X ~ Y, data=super)
summary(super.lm)
anova(super.lm)
names(super.lm)
cbind(super, super.lm$resid, super.lm$fitted)
# 잔차 그림 그리기
plot(super$X, super.lm$resid, pch=19)
abline(h=0, lty=2)
# 결과를 보면 잔차가 0을 중심으로 일정한 범위 내에 존재



# Practice - Multiple Linear Regression ####
market2 = read.table("~/Work/TIL-data/Regression Model/Sample Data/reg2020/market-2.txt", header=TRUE)
head(market2, 10)
X = market2[,c(2:3)]
X = cbind(1, X)
Y = market2[, 4]
X = as.matrix(X)
Y = as.matrix(Y)
XTX = t(X) %*% X
XTX
XTY = t(X) %*% Y
XTY
XTXI = solve(XTX)
beta = XTXI %*% XTY
beta = round(beta, 3)
beta

# F-value
market2.lm = lm(Y ~ X1 + X2, data = market2)
summary(market2.lm)
# 결정계수 0.9799이고, F-value = 292.5이며, 이에 대한 유의확률이 매우 작은 값
# 즉, 적합된 중회귀모형이 이 데이터를 설명하는 데 유의함
# F-value의 기각치 F(2, 12; 0.05)의 값 구하기
qf(0.95, 2, 12) # 3.885294
# 여기서 F0 = 292.5 > F(2, 12 ; 0.05)가 성립되어 가정된 중회귀방정식이 이 데이터를 설명하는 데 유의함
anova(market2.lm)



# Practice - Standardized Multiple Linear Regression ####
# install.packages("lm.beta")
library(lm.beta)
market2.lm = lm(Y ~ X1+X2, data=market2)
market2.beta = lm.beta(market2.lm)
print(market2.beta)
# 여기서 X1의 표준화계수가 X2의 표준화계수보다 큼
# 상대적으로 X1의 영향이 더 큼을 알 수 있음
summary(market2.beta)

# 신뢰구간
# x1 = 10, x2 = 10에서 E(y)를 95% 신뢰구간으로 추정
pred.x = data.frame(X1 = 10, X2 = 10)
pc = predict(market2.lm, int="c", newdata=pred.x)
pc
pc99 = predict(market2.lm, int="c", level=0.99, newdata = pred.x)
pc99

# 회귀계수 검정
summary(market2.lm)
# 1.55811 / 0.14793 = 10.532

# Extra sum of square
health = read.table("~/Work/TIL-data/Regression Model/Sample Data/reg2020/health.txt", header=TRUE)
head(health, 3)
h1.lm = lm(Y ~ X1, data=health)
h2.lm = lm(Y ~ X1+X4, data=health)
anova(h1.lm, h2.lm)

# Added variable plot 
# install.packages("car")
library(car)
h4.lm = lm(Y ~ X1+X2+X3+X4, data=health)
avPlots(h4.lm)

