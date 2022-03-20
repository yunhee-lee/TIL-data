# Binomial Distribution ####
# 공정한 동전을 5번 던시는 실험에서 P(X=0)
dbinom(0, 5, 0.5) # 0.03125
# 경험적으로 보험가입 확률은 20%, 영업사원이 고객 10명을 만날 예정일 때
# 세 명이 보험에 가입할 확률
dbinom(3, 10, 0.2)
# 두 사람 이상이 보험에 가입할 확률
# pbinom은 누적확률분포
1-pbinom(1, 10, 0.2)

# Poisson Distribution ####
dpois(4, 6) # 0.1338526

# Normal Distribution ####
# 확률변수 X가 평균이 70, 표준편차가 10인 정규분포를 따를 때
# P(X < 94.3)
pnorm(94.3, 70, 10)
# P(X > 57.7)
1-pnorm(57.7, 70, 10)
# 표준화
z <- (57.7-70)/10
1-pnorm(z, 0, 1)