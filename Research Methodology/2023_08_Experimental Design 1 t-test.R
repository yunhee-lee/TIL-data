rm(list=ls())
setwd("~/Work/TIL-data/Research Methodology")

sample1 <- c(10.2, 10.5, 10.3, 10.8, 9.8, 10.6, 10.7, 10.2, 10.0, 10.1)
sample2 <- c(9.8, 9.6, 10.1, 10.2, 10.1, 9.7, 9.5, 9.6, 9.8, 9.9)

# Data Visualization ####
density1 <- density(sample1)
density2 <- density(sample2)
# 밀도 곡선 그래프 생성
plot(density1, lty=1, ylim=c(0, 1.5), main = "Density Plot")
lines(density2, lty=2)
# 그래프에 타이틀과 범례 추가
legend("topright", legend=c("Sample 1", "Sample 2"), lty=c(1, 2))
title(main="Density Plot", xlab="Value", ylab="Density")

boxplot(sample1, sample2, ylab="performance", names=c("sample1", "sample2"))

# T-test Execution ####
t.test(sample1, sample2, var.equal=T) # defalut : two-sided

# Exercise Question 4
equip1 <- c(1.35, 1.16, 1.23, 1.20, 1.32, 1.28, 1.21, 1.25, 1.17, 1.19)
equip2 <- c(1.01, 0.98, 0.95, 1.05, 1.02, 0.96, 0.99, 0.98, 1.01, 1.02)
t.test(equip1, equip2, var.equal=T, alternative="greater", conf.level=0.01)

