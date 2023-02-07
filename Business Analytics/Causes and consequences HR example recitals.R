rm(list = ls(all = TRUE))

datatot = read.table("/Users/Yunhee/Work/TIL-data/Business Analytics/Sample Data/DATA_3.02_HR2.csv", sep = ',', header = TRUE)

str(datatot)
summary(datatot)

# look at the frequencies for variables
table(datatot$left)
table(datatot$left) / nrow(datatot)
hist(datatot$left)

cor(datatot)

logreg = glm(left ~ ., family = binomial(logit), data = datatot)

hist(logreg$fitted.values)
cor(logreg$fitted.values, datatot$left)

# cutoff to determine when p(leaving) should be considered as a leaver or not
cutoff = .3
table(logreg$fitted.values >= cutoff, datatot$left)
# compute the percentage of correctly classified employees who stayed
sum((logreg$fitted.values <= cutoff) & (datatot$left == 0)) / sum(datatot$left == 0)
# compute the percentage of correctly classified employees who left
sum((logreg$fitted.values > cutoff) & (datatot$left == 1)) / sum(datatot$left == 1)
# compute the overall percentage of correctly classified employees
mean((logreg$fitted.values > cutoff) == (datatot$left == 1))

summary(logreg)
# To look at how important they are, we can look at the absolute value of the z value
# We then look at the coefficient to see the direction of the effect

plot(datatot$TIC, datatot$left, main = "Time and Employee Attrition"
                              , ylab = "Attrition", xlab = "Time spent")

tempdata = datatot
aggbTimeRank = aggregate(left ~ TIC, data = tempdata, FUN = mean)
plot(aggbTimeRank$TIC, aggbTimeRank$left, main = "Time and Employee Attrition"
                                        , ylab = "Average Attrition Rate", xlab = "Time spent")

cntbTimeRank = aggregate(left ~ TIC, data = tempdata, FUN = length)
symbols(aggbTimeRank$TIC,aggbTimeRank$left
                        , circles = cntbTimeRank$left, inches = .75, fg = "white", bg = "red"
                        , main= "Time and Employee Attrition", ylab="Average Attrition Rate", xlab= "Time spent")