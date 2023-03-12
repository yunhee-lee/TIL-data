setwd("~/Work/TIL-data/Machine Learning")

# UCI productivity regression ####
# Importing data
prod = read.csv("Sample Data/productivityREG.csv", header = TRUE)
str(prod)

# Factorizing predictor variables
prod$quarter = factor(prod$quarter)
prod$department = factor(prod$department)
prod$day = factor(prod$day)
prod$team = factor(prod$team)

# Fitting a linear regression model
fit.all = lm(productivity ~ ., data = prod)
summary(fit.all)
# 범주형 변수의 경우, 각 범주에 따라 가변수(dummy variables)가 생성됨
fit.step = step(fit.all, direction = "both")
summary(fit.step)
fit.step$anova

# Making predictions
pred.reg = predict(fit.step, newdata = prod, type = "response")
print(pred.reg)

# Evaluation
mean((prod$productivity - pred.reg)^2) # MSE
mean(abs(prod$productivity - pred.reg)) # MAE



# UCI wine quality regression ####
# Importing data
wine = read.csv("Sample Data/winequalityCLASS.csv", header = TRUE)
str(wine)

# Fitting a logistic regression model
fit.all = glm(quality ~ ., family = binomial, data = wine)
fit.step = step(fit.all, direction = "both")
fit.step$anova
summary(fit.step)

# Making predictions
p = predict(fit.step, newdata = wine, type = "response")
cutoff = 0.5
# (참고) cutoff는 분석가의 주관에 따라 달라질 수 있음
yhat = ifelse(p > cutoff, 1, 0)

# Evaluation
tab = table(wine$quality, yhat, dnn = c("Observed", "Predicted"))
print(tab)
sum(diag(tab))/sum(tab) # accuracy = 정분류
tab[2, 2]/sum(tab[2, ]) # sensitivity = 민감도
tab[1, 1]/sum(tab[1, ]) # specificity = 특이도
