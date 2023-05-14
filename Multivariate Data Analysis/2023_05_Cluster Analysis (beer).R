rm(list = ls(all = TRUE))
setwd("~/Work/TIL-data/Multivariate Data Analysis")

beer <- read.csv("Sample Data/beer(2).csv", header = TRUE, row.names = 1)
head(beer)

summary(beer)
# 자료 표준화
zbeer <- scale(beer)
# description : 표준화가 잘 진행되었는지 확인하기 위해 열 평균과 표준편차 확인
round(apply(zbeer, 2, mean), 3)
round(apply(zbeer, 2, sd), 3)
# result : 각각 0과 1로 잘 표준화 됨을 알 수 있음

# 계층적 군집분석 ####
# 거리행렬 계산
zbeer_ecu <- dist(zbeer)
zbeer_ecu[1]
zbeer_man <- dist(zbeer, "manhattan")
zbeer_man[1]

# 계층적 군집분석 - 최단연결법
hc_s <- hclust(zbeer_ecu, method = "single")
hc_s
plot(hc_s, hang = -1)

# 계층적 군집분석 - 최장연결법
hc_c <- hclust(zbeer_ecu, method = "complete")
hc_c
plot(hc_c, hang = -1)

# 계층적 군집분석 - 와드의 방법
hc_w <- hclust(zbeer_ecu, method = "ward.D")
hc_w
plot(hc_w, hang = -1)

# 소속 군집 알기
hc_w24 <- cutree(hc_w, 2:4)
hc_w24
# result : 소속 군집의 수를 2-4개 중 몇 개로 하느냐에 따라 군집 배정이 달라지게 됨



# 비계층적 군집분석 - kmeans ####
kmc <- kmeans(zbeer, centers = 2)
kmc
# description : 소속 군집 데이터를 산점도 그리기
plot(zbeer, col = kmc$cluster, pch = 16)
# result : 데이터의 첫 두 가지 변수인 sodium, calories를 이용한 산점도가 그려짐
# 모든 변수를 사용한 산점도를 그리기 위해서는 다음과 같은 pairs 함수를 이용해야 함
pairs(zbeer, col = kmc$cluster, pch = 16, cex.labels = 1.5)




