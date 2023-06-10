rm(list = ls(all = TRUE))
setwd("~/Work/TIL-data/Multivariate Data Analysis")

data <- read.csv("Sample Data/data7-1.csv")
head(data, 3)

data_g1 = data[data$group == 'g1', -1]
data_g2 = data[data$group == 'g2', -1]

g1_mean = sapply(data_g1, mean)
g2_mean = sapply(data_g2, mean)
g1_mean
g2_mean

# description : 분산공분산 행렬 구하기
n1 = nrow(data_g1)
n2 = nrow(data_g2)
cov_g1 = cov(data_g1)
cov_g2 = cov(data_g2)
cov_g = ((n1 - 1) * cov_g1 + (n2-1) * cov_g2) / (n1 + n2 - 2)
cov_g

b = solve(cov_g) %*% (g2_mean - g1_mean)
round(b, 3)

# description : 판별함수를 이용한 분류 ####
y1_mean = g1_mean %*% b
y2_mean = g2_mean %*% b
yc = (y1_mean + y2_mean) / 2
yc

case1 = data_g1[1,]
case1 = as.matrix(case1)
y1 = case1 %*% b
y1

# description : 선형판별함수를 이용한 분류 ####
library(MASS)
data <- read.csv("Sample Data/data7-1.csv")
head(data, 5)

data_lda = lda(group ~ ., data = data)
data_lda

pred_lda = predict(data_lda, newdata = data)
names(pred_lda)
# description : 분류된 그룹 결과
pred_lda$class
# description : 각 그룹에 속할 사후확률, 더 큰 값을 같는 그룹으로 분류
head(pred_lda$posterior)
# description : 각 케이스의 분류 점수
# 분류점수는 평균이 0이 되도록 중심화된 값
head(pred_lda$x)

# description : 분류점수를 직접 구하기
prior <- data_lda$prior
scaling <- data_lda$scaling
d_means <- data_lda$means
means = colSums(prior * d_means) # 그룹의 평균
x = data[, -1]
dscore = scale(x, center = means, scale = FALSE) %*% scaling
head(dscore, 3)

# description : 분류점수 시각화
library(klaR)
ldahist(pred_lda$x, g = data$group)

plot(pred_lda$x, pch = 19)
text(pred_lda$x, data$group, cex = 0.7, pos = 4)
abline(h = 0, lty = 2)

# description : 판별함수 모형 평가
x <- data[, -1]
data_man = manova(as.matrix(x) ~ pred_lda$class)
wilks_test = summary(data_man, test = "Wilks")
wilks_test

# description : confusion matrix
confm_lda = table(data$group, pred_lda$class)
confm_lda
prop.table(confm_lda, 1) # 행을 기준으로 비율 구할 것
error = 1 - sum(diag(prop.table(confm_lda)))
error
