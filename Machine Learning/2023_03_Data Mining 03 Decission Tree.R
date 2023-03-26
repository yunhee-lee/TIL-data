setwd("~/Work/TIL-data/Machine Learning")

# Classification tree - wine datasets ####
wine <- read.csv("Sample Data/winequalityCLASS.csv", header = TRUE)
wine$quality <- factor(wine$quality)

# Classification tree 
library(rpart)
set.seed(1225)

# cp 값을 0으로 설정했기 때문에 최대 나무가 구성됨
# 과다적합 모형으로, 새로운 값이 포함되었을 때 예측력이 굉장히 낮을 수 있음
my.control <- rpart.control(xval = 10, cp = 0, minsplit = 20)
tree.wine <- rpart(quality ~ ., data = wine, method = "class", control = my.control)
print(tree.wine)

# Display tree
library(rpart.plot)
prp(tree.wine, type = 4, extra = 1, digits = 2, box.palette = "Grays")

# Pruning with c-s.e.
cps <- printcp(tree.wine)
k <- which.min(cps[, "xerror"])
err <- cps[k, "xerror"]; se <- cps[k, "xstd"]
c <- 1 # 1-s.e.
k1 <- which(cps[, "xerror"] <= err + c * se)[1]
cp.chosen <- cps[k1, "CP"]
tree.pruned.wine <- prune(tree.wine, cp = cp.chosen)
print(tree.pruned.wine)
prp(tree.pruned.wine, type = 4, extra = 1, digits = 2, box.palette = "Grays")

# Making predictions
prob.tree.wine <- predict(tree.pruned.wine, newdata = wine, type = "prob")
head(prob.tree.wine)
cutoff <- 0.5
yhat.tree.wine <- ifelse(prob.tree.wine[, 2] > cutoff, 1, 0)

# Evaluation
tab <- table(wine$quality, yhat.tree.wine, dnn = c("observed", "predicted"))
print(tab)
sum(diag(tab))/sum(tab) # accuracy
tab[2, 2]/sum(tab[2, ]) # sensitivity
tab[1, 1]/sum(tab[1, ]) # specificity



# Regression tree - productivity datasets ####
prod <- read.csv("Sample Data/productivityREG.csv", header = TRUE)

# Factorizing predictor variables
prod$quarter = factor(prod$quarter)
prod$department = factor(prod$department)
prod$day = factor(prod$day)
prod$team = factor(prod$team)

# Regression tree
library(rpart)
set.seed(1225)
my.control <- rpart.control(xval = 10, cp = 0.01, minsplit = 30)
tree.prod = rpart(productivity ~ ., data = prod, method = "anova", control = my.control)
print(tree.prod)

# Pruning with c-s.e.
cps <- printcp(tree.prod)
k <- which.min(cps[, "xerror"])
err <- cps[k, "xerror"]; se <- cps[k, "xstd"]
c <- 1 # 1-s.e.
k1 <- which(cps[, "xerror"] <= err + c * se)[1]
cp.chosen <- cps[k1, "CP"]
tree.pruned.prod <- prune(tree.prod, cp = cp.chosen)
print(tree.pruned.prod)
prp(tree.pruned.prod, type = 4, extra = 1, digits = 2, box.palette = "Grays") 

# Making predictions
pred.tree.prod <- predict(tree.pruned.prod, newdata = prod, type = 'vector')
head(pred.tree.prod, 5)

# Evaluation
mean((prod$productivity - pred.tree.prod)^2)  # MSE
mean(abs(prod$productivity - pred.tree.prod)) # MAE

# Observed vs. Predicted
plot(prod$productivity, pred.tree.prod, xlab = "Observed Values", ylab = "Fitted Values")
abline(0,1)
