rm(list = ls(all = TRUE))
setwd("~/Work/TIL-data/Multivariate Data Analysis")

sales <- read.csv("Sample Data/sales.csv")
# description : 한 회사의 판매사원 50명을 대상으로 조사한 적성시험(X)과 판매실적(Y)
# x1 창의력, x2 조직적 사고력, x3 추리력, x4 수리력
# y1 판매 성장률, y2 판매 이익률, y3 새로운 고객 판매율
head(sales)
summary(sales[, -1])

library(psych)
SD(sales[, -1])

# 산점도 및 상관계수 행렬 구하기 ####
library(ggplot2); library(GGally); library(CCA)
exam <- sales[, c(2:5)]
perform <- sales[, c(6:8)]
# scatterplots and correlation of exam
ggpairs(exam)
dev.new()
ggpairs(perform)
# description : 두 변수군 객체의 상관계수행렬을 구하는 명령
matcor(exam, perform)
# result : $XYcor를 보면 x-변수군과 y-변수군 사이에 전반적으로 강한 양의 상관관계가 있음

# 정준상관분석 실행 ####
cano_result <- cc(exam, perform)
names(cano_result)
cano_result$cor
# result : 제1정준상관계수가 0.9942로 가장 높음

# description : 각 정준변수의 선형결합 계수를 확인할 수 있음
round(cano_result$xcoef, 3)
round(cano_result$ycoef, 3)

# description : 정준변수부하 (canonical variable loadings) 결과 - 정준변수에 대한 각 변수의 기여도를 알고자 할 때 이용
cano_result$scores

# 정준변수 산점도
w1 = cano_result$score$xscores[, 1]
v1 = cano_result$score$yscores[, 1]
cor(w1, v1)

plot(w1, v1, pch = 19)
