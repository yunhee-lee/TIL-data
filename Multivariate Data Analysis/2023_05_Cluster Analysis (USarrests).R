rm(list = ls(all = TRUE))
setwd("~/Work/TIL-data/Multivariate Data Analysis")

head(USArrests)
summary(USArrests)
zUSArrests <- scale(USArrests)

# 계층적 군집분석 ###
hc_a <- hclust(dist(zUSArrests), method = "average")
hc_a
plot(hc_a, hang = -1)

hcmember <- cutree(hc_a, k = 5)
hcmember

# description : 각 군집별 중심점 찾기
data_combined <- cbind(USArrests, hcmember)
aggregate(. ~ hcmember, data_combined, mean)



# K-means 군집분석 ####
zUSArrests <- scale(USArrests)
kmc1 <- kmeans(zUSArrests, 4)
kmc1

# description : 소속 군집 산점도
pairs(USArrests, col = kmc1$cluster, pch = 16, cex.labels = 1.5)
# result : 좌측 하단의 군집 3이 가장 범죄 체포자 수가 적은 곳, 우측 상단인 군집 1이 가장 범죄 체포자 수가 많은 곳