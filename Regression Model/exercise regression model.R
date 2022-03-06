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