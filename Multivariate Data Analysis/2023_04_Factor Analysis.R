rm(list = ls())
setwd("~/Work/TIL-data/Multivariate Data Analysis")

# 인자분석 모형은 다음과 같은 R function을 통해 구현할 수 있음
# psych::principal (method : principal factor method)
# stats::factanal (method : maximum likelihood method)
# psych::fa (method : minres)

# principal factor method ####
library(psych)
library(GPArotation)

med_data <- read.csv("Sample Data/medFactor.csv")
head(med_data, 5)
summary(med_data)

# 인자분석 가능 여부 확인
cortest.bartlett(med_data)
# result : p-value가 0에 근접한 숫자로, 상관계수 행렬이 단위행렬과 유의하게 다름
# 즉, 인자분석이 가능함을 의미
KMO(med_data)
# result : Overall MSA = 0.69로 인자분석이 가능

# 초기 인자분석 실행
med_factor <- principal(med_data, rotate = "none")
names(med_factor)
med_factor$values
# result : value 값이 1 이상인 인자가 3개
plot(med_factor$values, type = "b", pch = 19)

med_varimax <- principal(med_data, nfactors = 3, rotate = "varimax", scores = TRUE, method = "regression")
med_varimax
# result : h2 column이 communality를 나타냄
# result : (Cumm.) proportion var은 각 인자가 설명하는 총분산의 비율을 의미



# maximum likelihood method ####
# R에 내장된 state.x77 데이터 이용 - 1970년대 미국 50개 주의 인구, 수입, 문맹 등에 대한 각종 정보
state <- state.x77
summary(state)

library(stats)
state_fact0 <- factanal(state, factors = 4)
sosq <- function(v) {sum(v^2)}
loadings <- as.matrix(state_fact0$loadings)
eigen_value <- apply(loadings, 2, sosq)
round(eigen_value, 3)
# result : 1보다 큰 인자 수 세 개
state_fact <- factanal(state, factors = 3, rotation = "varimax")
state_fact
# result : population의 공통성이 0.187의 매우 작은 값을 가져 제외하는 것이 타당
state_fact1_1 <- factanal(state[, -1], factor = 3, rotation = "varimax", Scores = "Bartlett")
state_fact1_1
