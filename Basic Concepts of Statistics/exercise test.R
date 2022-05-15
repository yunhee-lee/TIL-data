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
