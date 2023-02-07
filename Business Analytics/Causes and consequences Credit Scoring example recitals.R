rm(list = ls(all = TRUE))

data = read.table("~/Work/TIL-data/Business Analytics/Sample Data/DATA_3.01_CREDIT.csv", sep = ',', header = TRUE)

str(data)
summary(data)

hist(data$Rating)
# compute the correlation between all the numerical variables of the sample
# Rating(신용점수)에 영향을 주는 variable을 직관적으로 확인할 수 있음
cor(data[, c(1:5, 10)])

# Estimate a linear regression model of Rating as a function of everything else
linreg = lm(Rating ~ ., data = data)

# computes the correlation between the fitted values and the actual ones
cor(linreg$fitted.values, data$Rating)
plot(data$Rating, linreg$fitted.values)

summary(linreg)
# the statistically significant variables are the income variable, the student variable, and the balance variable
# since the absolute value of the t-value of the bounds variable is the largest

plot(data$Balance, data$Rating)
plot(data$Income, data$Rating)