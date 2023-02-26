setwd("~/Work/TIL-data/Machine Learning")

# UCI productivity pre-processing ####
library(MASS)

prod <- read.csv("Sample Data/productivityORG.csv")
head(prod, 10)
str(prod)

prod$date <- as.Date(prod$date, format = '%m/%d/%Y')
prod$quarter <- factor(prod$quarter)
prod$department <- factor(prod$department)
prod$day <- factor(prod$day)
prod$team <- factor(prod$team)
summary(prod)
attach(prod)

# 각 variable의 분포와 이상치 탐지
par(mfrow=c(3,4))
boxplot(target, col="cyan3", xlab="Target Productivity")
boxplot(smv, col="cyan3", xlab="Standard Minute Value")
boxplot(wip, col="cyan3", xlab="Work in Progress")
boxplot(over_time, col="cyan3", xlab="Overtime")
boxplot(incentive, col="cyan3", xlab="Incentive")
boxplot(idle_time, col="cyan3", xlab="Idle TIme")
boxplot(idle_men, col="cyan3", xlab="Idle Men")
boxplot(numchange, col="cyan3", xlab="Number of Changes in Style")
boxplot(numworkers, col="cyan3", xlab="Number of Workers")
boxplot(productivity, col="cyan3", xlab="Productivity")

# 이상치 제거
dout <- rep(0, 15)
dout2 <- rep(0, 15)
for (i in 6:15){
  t3 <- quantile(prod[, i], 0.75)
  t1 <- quantile(prod[, i], 0.25)
  tq <- IQR(prod[, i], 0.75)
  dout[i] <- t3 + 1.5*tq
  dout2[i] <- t1 - 1.5*tq
}
outindex <- matrix(0, 1197, 15)
for (i in 1:1197)
  for (j in 6:15) {
    if (prod[i, j] > dout[j] || prod[i, j] < dout2[j]) outindex[i, j] <- 1
  }

# outindex를 통해서 이상치가 있는 관측 값을 제거
# 기존 variable 중 date, 대부분 관측 값이 0인 idle_time, idle_men, numchange 제외
# prodnew data set 생성
prod2 <- prod[apply(outindex, 1, sum) == 0, ]
prodnew <- prod2[, -c(1, 11:13)]
head(prodnew)
str(prodnew)
write.csv(prodnew,"Sample Data/productivityREG.csv", quote=F, row.names=F)

detach(prod)

# UCI wine quality pre-processing ####
wine <- read.csv("Sample Data/winequalityORG.csv")
attach(wine)

head(wine, 10)
str(wine)

par(mfrow = c(3, 4))
boxplot(fixed, col = "cyan3", xlab = "Fixed Acidity")
boxplot(volatile, col = "cyan3", xlab = "Volatile Acidity")
boxplot(citric, col = "cyan3", xlab = "Citric Acid")
boxplot(residsugar, col = "cyan3", xlab = "Rsidual Sugar")
boxplot(chlorides, col = "cyan3", xlab = "Chlorides")
boxplot(freeSD, col = "cyan3", xlab = "Free Sulfur Dioxide")
boxplot(totalSD, col = "cyan3", xlab = "Total Sulfur Dioxide")
boxplot(density, col = "cyan3", xlab = "Density")
boxplot(pH, col = "cyan3", xlab = "pH")
boxplot(sulphates, col = "cyan3", xlab = "Sulphates")
boxplot(alcohol, col = "cyan3", xlab = "Alchol")

dout <- rep(0, 12)
dout2 <- rep(0, 12)
for (i in 1:11) {
  t3 <- quantile(wine[, i], 0.75)
  t1 <- quantile(wine[, i], 0.25)
  tq <- IQR(wine[, i], 0.75)
  dout[i] <- t3 + 1.5 * tq
  dout2[i] <- t1 - 1.5 * tq
}
outindex <- matrix(0, 1599, 12)
for (i in 1:1599)
  for(j in 1:11) {
    if (wine[i, j] > dout[j] || wine[i, j] < dout2[j]) outindex[i, j] <- 1
  }
wine2 <- wine[apply(outindex, 1, sum) == 0, ]
table(wine2$quality)
write.csv(wine2, "Sample Data/winequalityCLASS.csv", quote = F, row.names = F)
detach(wine)

# Create dummy variables ####
library(dummy)
prod <- read.csv("Sample Data/productivityREG.csv")
summary(prod)

prod$quarter <- factor(prod$quarter)
prod$department <- factor(prod$department)
prod$day <- factor(prod$day)
prod$team <- factor(prod$team)
summary(prod)

dvar <- c(1:4)
prod2 <- dummy(x = prod[, dvar])
# 5, 7, 13, 25 column은 numeric variables
prod2 <- prod2[, -c(5, 7, 13, 25)]
prod <- cbind(prod[, -dvar], prod2)
for(i in 1:ncol(prod))
  if(!is.numeric(prod[, i])) prod[, i] <- as.numeric(prod[, i])

str(prod)
