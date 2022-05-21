# 모평균의 가설검정 ####
n = 10; s = 0.2; bar_x = 12.2;
alpha = 0.05
ttest = (bar_x-12)/(0.2/sqrt(10)) # 검정통계량
ttest_cr = qt(1-alpha/2, n-1) # 기각역
# qt(vector of probabilities, degrees of freedom)
ttest_pv = (1-pt(ttest, n-1))*2 # 유의확률
# pt(vector of quantiles, degree of freedom)
cat("검정통계량값 : ", ttest, "기각역 : ", ttest_cr, "유의확률 : ", ttest_pv)
# 검정통계량값 :  3.162278 기각역 :  2.262157 유의확률 :  0.01150799
# 5% 유의수준에서 귀무가설 기각

# 모비율의 가설검정 ####
p0 = 0.6; n = 50; hat_p = 0.7
alpha = 0.05
ptest = (hat_p-p0)/sqrt(p0*(1-p0)/n)
ptest_cr = qnorm(1-alpha)
ptest_pv = 1-pnorm(ptest)
cat("검정통계량값 : ", ptest, "기각역 : ", ptest_cr, "유의확률 : ", ptest_pv)
# 검정통계량값 :  1.443376 기각역 :  1.644854 유의확률 :  0.07445734
# 유의수준 5%에서 귀무가설을 기각하지 못함

# 모분산의 가설검정 ####
n = 12; alpha = 0.05
book <- c(5, 23, 20, 1, 10, 15, 15, 10, 9, 13, 18, 11)
vtest = var(book)*(12-1)/4^2
vtest_cr = qchisq(1-alpha, n-1)
vtest_pv = 1-pchisq(vtest, n-1)
cat("검정통계량값 : ", vtest, "기각역 : ", vtest_cr, "유의확률 : ", vtest_pv)
# 검정통계량값 :  26.5625 기각역 :  19.67514 유의확률 :  0.005347859
# 유의수준 5%에서 귀무가설을 기각

# 독립성 검정 ####
dept <- c(rep("stat", 50), rep("ds", 25))
regi <- c(rep("y", 20), rep("n", 30), rep("y", 13), rep("n", 12))
deptregi <- data.frame(dept, regi)
# 서로 교차하는 분산표를 만드는 xtabs 함수
rtable <- xtabs(~dept+regi, data=deptregi)
rtable
# 검정
ctest <- chisq.test(rtable, correct=F)
ctest

# 적합도 검정 ####
# 은행 전국 60개 지점의 당일 부도수표를 관측
catnum <- c(0:3)
obs <- c(33, 15, 9, 3) # 전체 합 60개
m <- sum(catnum*obs)/sum(obs) # 분할표를 이용하여 구한 표본 평균
pprob <- round(dpois(catnum, m), 3)
pprob # 0.497 0.348 0.122 0.028
# 분포함수를 이루기 위해 합이 1이 되도록 조정
pprob[4] <- 1-sum(pprob[1:3])
pprob # 0.497 0.348 0.122 0.033
pprob * 60 # 29.82 20.88  7.32  1.98 > 기댓값 계산 결과
# 기대도수 5미만 범주를 병합하여 재분석
obs1 <- c(33, 15, 12)
pprob1 <- pprob[1:3]
pprob1[3] <- 1-sum(pprob[1:2])
# 검정
ctest <- chisq.test(obs1, p=pprob1)
# 아래 chisq의 자유도는 병합한 범주의 개수(3) - 추정모수의 개수(1) - 1
ctest$statistic > qchisq(0.95, 1)
