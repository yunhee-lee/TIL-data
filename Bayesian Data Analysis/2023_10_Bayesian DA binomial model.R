rm(list=ls())
setwd("~/Work/TIL-data/Bayesian Data Analysis")

# 모형 : binary
# 사전분포 : beta
# 사후분포 : beta
# 위 모형에서 n = 10일 때, x = 3을 관측하였다.
# 이 때 사전분포, 사후분포, 가능도를 한 그림에 그리세요.

# 문제에 필요한 기본 값을 정의
alpha <- 1; beta <- 1;
n <- 10; x <- 3;

# 사전분포, 사후분포, 가능도를 벡터로 계산
theta <- seq(from=0, to=1, length=100)
prior.den <- dbeta(theta, alpha, beta)
post.den <- dbeta(theta, alpha+x, beta+n-x)
likelihood <- dbinom(x, size=n, prob=theta)
# 각각을 적분하면 1이 되도록 정규화
likelihood <- 100*likelihood/sum(likelihood)

par(mfrow=c(2, 2))
plot(theta, prior.den, type="l", ylab="prior density")
plot(theta, likelihood, type="l", ylab="likelihood")
plot(theta, post.den, type="l", ylab="posterior density")
par(mfrow=c(1, 1))

# 세 개의 그래프를 한 윈도우에 그리기
ymax = max(prior.den, likelihood, post.den)
plot(theta, post.den, type="l", ylab="density", ylim=c(0, ymax))
lines(theta, prior.den, col="magenta")
lines(theta, likelihood, col="cyan")
legend(0.6, 2.8, c("posterior", "prior", "likelihood"),
       lty=c(1, 1, 1), lwd=c(2.5, 2.5), col=c("black", "magenta", "cyan"))