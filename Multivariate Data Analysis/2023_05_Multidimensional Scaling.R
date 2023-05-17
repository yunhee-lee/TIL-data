rm(list = ls(all = TRUE))
setwd("~/Work/TIL-data/Multivariate Data Analysis")

auto <- read.csv("Sample Data/auto.csv")
str(auto)

x <- auto[, -1]
autoName <- auto[, 1]
# z-standardization
zx <- scale(x, center = TRUE, scale = TRUE)
# 0-1 transformation
max_x <- apply(x, 2, max)
min_x <- apply(x, 2, min)
z01x <- scale(x, center = min_x, scale = max_x - min_x)

# 거리행렬 만들기
z01x_dist <- dist(z01x, method = 'euclidean')
z01x_dist <- as.matrix(z01x_dist)
colnames(z01x_dist) = autoName
rownames(z01x_dist) = autoName
z01x_dist

# cmdscale 함수 활용
mds1 <- cmdscale(z01x_dist, k = 2) # k option은 차원을 나타냄
head(mds1)
plot(mds1[, 1], mds1[, 2], type = 'n', xlab = '', ylab = '', main = 'cmdscale(Auto)')
text(mds1[, 1], mds1[, 2], rownames(z01x_dist), cex = 0.7)
abline(h = 0, v = 0, lty = 2)
# result : x 축은 오른쪽에 큰 차(비싼 차), 왼쪽에 경차(저렴한 차)가 분포되어 있어 가격을 대표 / y 축은 차체 크기 대비 연비를 대표
# MDS는 개체들을 대상으로 상호 거리를 측정할 수 있는 자료를 관측한 후에 개체들을 저차원 공간 상에 표현하여 상호 관계를 관측

# smacof::mds 활용
# library(smacof)
# library install 과정에 문제가 있어, 코드 실행은 생략함
