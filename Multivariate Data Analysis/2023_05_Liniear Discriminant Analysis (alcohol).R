rm(list = ls(all = TRUE))
setwd("~/Work/TIL-data/Multivariate Data Analysis")

alcohol = read.csv("Sample Data/alcohol.csv")
head(alcohol)
summary(alcohol[, -1])
boxplot(alcohol[, -1])

library(MASS)
alcohol_lda <- lda(TYPE ~ ., data = alcohol)
alcohol_lda
# result : 그룹 수가 3개로, 2개의 선형판별함수가 출력
pred_lda <- predict(alcohol_lda, newdata = alcohol)
names(pred_lda)
head(pred_lda$posterior, 10)
head(pred_lda$x, 10)

indep_vars = alcohol[, -1]
alcohol_man <- manova(as.matrix(indep_vars) ~ pred_lda$class)
alcohol_wilks <- summary(alcohol_man, test = "Wilks")
alcohol_wilks
# result : p-value가 2.2e-16으로 판별 함수모형이 유의함

confm_lda <- table(alcohol$TYPE, pred_lda$class)
confm_lda
# description : error rate
error <- 1 - sum(diag(confm_lda)) / sum(confm_lda)
error

# description : 변수 선택
# install.packages("klaR")
library(klaR)
alcohol_forward <- greedy.wilks(TYPE ~ ., data = alcohol, noveau = 0.01) # 유의확률 기준 0.01
alcohol_forward

alcohol_fwd_lda <- lda(alcohol_forward$formula, data = alcohol)
alcohol_fwd_lda
# 변수 선택 후 분류표
pred_fwd_lda <- predict(alcohol_fwd_lda, newdata = alcohol)
confm_fwd <- table(alcohol$TYPE, pred_fwd_lda$class)
confm_fwd
error_fwd <- 1 - sum(diag(confm_fwd)) / sum(confm_fwd)
error_fwd

library(dplyr)
alcohol$TYPE = recode(alcohol$TYPE, typeA = "A", typeB = "B", typeC = "C")
head(alcohol, 10)
pred_alc <- predict(alcohol_fwd_lda, newdata = alcohol)
head(pred_alc$x, 10)

# description : 판별함수 산점도
plot(pred_alc$x[, 1], pred_alc$x[, 2], pch = 19)
text(pred_alc$x[, 1], pred_alc$x[, 2], alcohol$TYPE, cex = 0.5, pos = 4, col = "red")
abline(v = -2, lty = 2)
lines(c(-2, 3.7), c(-0.1, -0.1), lty = 2)

# 2-d 분류 산점도 행렬
# partimat() 함수는 가능한 두 독립변수의 행렬에 대해서 분류결과를 시각적으로 보여줌
library(klaR)
nlevels(alcohol$TYPE)
alcohol$TYPE = as.factor(alcohol$TYPE)
nlevels(alcohol$TYPE)
partimat(TYPE ~ BU1 + MEPR + MEOH + ACET + LNPRO1, data = alcohol, method = "lda",
         nplots.vert = 4, nplots.hor = 3)
# result : 오분류율이 가장 작은 두 변수 조합은 (MEOH, MEPR)








