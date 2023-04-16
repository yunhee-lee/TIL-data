rm(list = ls())
setwd("~/Work/TIL-data/Multivariage Data Analysis")

library(HSAUR2)
data(heptathlon) # 1988년 서울 올림픽 여성 7종 경기 결과
summary(heptathlon)

# Data transformation
heptathlon$hurdles = max(heptathlon$hurdles) - heptathlon$hurdles
heptathlon$run200m = max(heptathlon$run200m) - heptathlon$run200m
heptathlon$run800m = max(heptathlon$run800m) - heptathlon$run800m
head(heptathlon)

# PCA implementation
hep_data <- heptathlon[, -8] # the last column is 'score'
hep_pca <- princomp(hep_data, cor = T, scores = T)
# cor = T option을 통해서 상관계수 행렬을 지정
names(hep_pca)
hep_pca

summary(hep_pca)
eig_val <- hep_pca$sdev^2
round(eig_val, 3)
# As a result, comp. 1 and comp. 2 are >= 1
# According to 'prop. of variance' comp. 1 + comp. 2 contains 80.8% of total variance

# Scree Plot
screeplot(hep_pca, type = "lines", pch = 19, main = "Scree Plot")
# Cumulated Scree Plot
hep_var <- hep_pca$sdev^2
hep_var_ratio <- hep_var/sum(hep_var)
round(hep_var_ratio, 3)

plot(cumsum(hep_var_ratio), type = "b", pch = 19,
     main = "Variance Explained", xlab = "Component", ylab = "Cumulative Proportion")

# Coefficient of principal component
round(hep_pca$loadings[, c(1:2)], 3)

# Scores into bi-plot
hep_pca$scores[c(1:5), c(1:2)]
biplot(hep_pca, cex = 0.7, col = c("Red", "Blue"))
# blue - coefficient
# red - score
title("Bi-plot")
# ingiths : Choubenkova (URS) is good at javelin