rm(list = ls())
setwd("~/Work/TIL-data/Machine Learning")

wine = read.csv("Sample Data/winequalityCLASS.csv", header = TRUE)

# factorize for classification
wine$quality = factor(wine$quality)

library(rpart)
library(adabag)

# Bagging ####
set.seed(1225)
my.control = rpart.control(xval = 0, cp = 0, minsplit = 5)
bag.wine = bagging(quality ~ ., data = wine, mfinal = 100, control = my.control)
bag.wine # result object

print(bag.wine$importance)
importanceplot(bag.wine)
# result : variable importance가 높은 변수는 alchol

evol.wine = errorevol(bag.wine, newdata = wine)
plot.errorevol(evol.wine)
# result : error가 평탄화 되는 지점이 어디인지 확인 (다소 주관적)

# description : making predictions
prob.bag.wine = predict.bagging(bag.wine, newdata = wine)$prob
head(prob.bag.wine, 10)
cutoff = 0.5
yhat.bag.wine = ifelse(prob.bag.wine[, 2] > cutoff, 1, 0)

tab = table(wine$quality, yhat.bag.wine, dnn = c("Observed", "Predicted"))
print(tab)



# Boosting ####
set.seed(1225)
my.control = rpart.control(xval = 0, cp = 0, maxdepth = 4)
boo.wine = boosting(quality ~ ., data = wine, boos = TRUE, mfinal = 100, control = my.control)

print(boo.wine$importance)
importanceplot(boo.wine)

evol.wine = errorevol(boo.wine, newdata = wine)
plot.errorevol(evol.wine)



# Random Forest ####
library(randomForest)
set.seed(1225)
rf.wine = randomForest(quality ~ ., data = wine, ntree = 100, mtry = 5, importance = TRUE, na.action = na.omit)
# description : variable importance
importance(rf.wine, type = 1)
varImpPlot(rf.wine, type = 1)
# result : bagging과 유사하게 분류기의 개수가 많을 수록, 오류가 급격히 줄어드는 형태
# description : plot error rates
plot(rf.wine, type = "l")
partialPlot(rf.wine, pred.data = wine, x.var = 'alcohol', which.class = 1)
# result : 전반적으로 숫자(관찰값)가 늘어남에 따라, 영향도가 높아짐

prob.rf.wine = predict(rf.wine, newdata = wine, type = "prob")
head(prob.rf.wine, 5)
cutoff = 0.5
yhat.rf.wine = ifelse(prob.rf.wine[, 2] > cutoff, 1, 0)

# description : evaluation
tab = table(wine$quality, yhat.rf.wine, dnn = c("Observed", "Predicted"))
print(tab)
sum(diag(tab))/sum(tab) # accuracy
tab[2, 2]/sum(tab[2, ]) # sensitivity
tab[1, 1]/sum(tab[1, ]) # specificity

