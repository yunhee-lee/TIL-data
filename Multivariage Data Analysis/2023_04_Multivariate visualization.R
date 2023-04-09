rm(list = ls())
setwd("~/Work/TIL-data/Multivariage Data Analysis")

survey <- read.csv("Sample Data/survey.csv")
str(survey)

# 단변량 그래프 ####
# 빈도표 구하기
edu_tb <- table(survey$edu)
rownames(edu_tb) <- c("None", "Elementary Graduate", "Middle Graduate", "High Graduate", "Colleage Graduate")
print(edu_tb)

# Bar plot
barplot(edu_tb)
# Graphic Device를 새롭게 생성하기 위한 명령
dev.new()

# Pie graph
pie(edu_tb, main = "Education Lv.")
dev.off()

# Stacked Barplot
sex_edu <- list(survey$sex, survey$edu)
sex_edu_tb <- table(sex_edu)
barplot(sex_edu_tb, levend.text = rownames(sex_edu_tb), col = c("red", "blue"))
title("Stacked Barplot")

# 한 화면에 여러 개의 그림 그리기 : par문 이용
par(mfrow = c(1, 2))
pie(sex_edu_tb[1, ])
title("Education of Male")
pie(sex_edu_tb[2, ])
title("Education of Female")

# 이변량 그래프 ####
# 히스토그램, 줄기-잎 그림 및 상자그림 그리기
hist(survey$salary)
stem(survey$salary)
boxplot(salary ~ sex, data = survey)
title("Boxplot of Salary")

# Line plot
plot(co2)
lines(smooth(co2), col = "blue")

# Bivariate boxplot
library(HSAUR2)
library(MVA)
data(USairpollution)
head(USairpollution, 3)

x <- USairpollution[, c(3, 4)]
dev.new()
bvbox(x, xlab = "manu", ylab = "popul", pch = 10)
title("Bivariate Plot")
identify(x)

# Bubble plot
plot(wind ~ temp, data = USairpollution, pch = 9)
# (temp, wind)의 산점도에 제 3의 변수인 SO2의 정보의 크기에 따라 원으로 나타낸 그림
with(USairpollution, symbols(temp, wind, circle = SO2, inches = 0.5, add = TRUE))
title("Bubble plot")


# 다차원 그래프 ####
# 산점도 행렬
social <- read.table("Sample Data/social.txt", header = TRUE)
str(social)
pairs(social)

