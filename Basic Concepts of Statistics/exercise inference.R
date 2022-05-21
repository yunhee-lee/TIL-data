# 모평균의 신뢰구간 추정 ####
# 데이터 입력
score <- c(88, 83, 83, 85, 94, 88, 91, 96, 89, 83, 81, 80, 84, 89, 83, 79)
# 표본평균과 표본표준편차
bar_x = mean(score) ; s = sd(score); n = length(score)
# 모평균의 95% 신뢰구간
qt(0.975, 15)
qt(0.025, 15, lower.tail=FALSE)

qt_95 = qt(0.975, 15)
c(bar_x - qt_95*s/sqrt(n), bar_x + qt_95*s/sqrt(n))

t.test(score)$conf.int


# 모비율의 신뢰구간 추정 ####
n = 500; X = 200
p_hat = X/n
alpha = 0.05
z_1 = qnorm(1-alpha/2)
c(p_hat - z_1*sqrt(p_hat*(1-p_hat)/n), p_hat + z_1*sqrt(p_hat*(1-p_hat)/n))

prop.test(X, n)$conf.int


# 모분산의 신뢰구간 추정 ####
s2 = 4^2
n = 40
alpha = 0.05
q_1 = qchisq(1-alpha/2, n-1)
q_2 = qchisq(alpha/2, n-1)
c((n-1)*s2/q_1, (n-1)*s2/q_2)

# 두 모집단의 비교 - 대응표본 ####
pre <- c(72, 80, 83, 63, 66, 76, 82)
post <- c(78, 82, 82, 68, 70, 75, 88)
exam1 <- data.frame(pre, post)
t.test(exam1$pre, exam1$post, mu=0, alternative="less", paired=T)

# 다수 모집단의 비교 - 분산분석 ####
# 일원배치법
x <- c(84, 83, 82, 85, 89, 86, 93, 94, 96, 89, 89, 87)
A <- c(rep(1, 3), rep(2, 3), rep(3, 3), rep(4, 3))
A <- factor(A)
aovdat1 <- data.frame(x, A)
aovmodel1 <- aov(x ~ A, data=aovdat1)
summary(aovmodel1)
# 이원배치법
y <- c(97.8, 97.5, 96.9, 98.5, 97.8, 97.1, 99.2, 98.4, 98.1, 98.2, 97.5, 96.8)
surface <- c(rep(1, 3), rep(2, 3), rep(3, 3), rep(4, 3))
manu <- rep(c(1, 2, 3), 4)
surface <- factor(surface); manu <- factor(manu)
aovdat2 <- data.frame(surface, manu)
aovmodel2 <- aov(y ~ surface+manu)
summary(aovmodel2)

