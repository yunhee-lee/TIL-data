# https://www.stat.pitt.edu/stoffer/tsa4/R_toot.htm
install.packages("astsa")
library(astsa)

# astsa packages에 내장되어 있는 전체 data 확인
data() 

# jj dataset 탐색
jj[1] # the first element
jj[84] # the last element
jj[-(1:80)] # everything EXCEPT the first 80 elements
length(jj)  # the number of elements 
dim(jj); nrow(jj); ncol(jj) # 모두 NULL 값으로, jj는 84 x 1 vector

jjm = as.matrix(jj)
dim(jjm)

# make a monthly time series object that starts in June of the year 2293
options(digits=2) # the default is 7, but it's more than I want now
(zardoz = ts(rnorm(48), start=c(2293, 6), frequency=12))
# use window() if you want a part of a ts object
(oz = window(zardoz, start=2294, end=c(2295,12)))

plot(jj, ylab="Earnings per Share", main="J & J")
plot(jj, type="o", col="blue", lty="dashed")
plot(diff(log(jj)), main="logged and diffed")

# plot.ts and ts.plot
x = -5:5 # sequence of integers from -5 to 5
y = 5*cos(x)      
par(mfrow=c(3,2)) # multi-figure setup: 3 rows, 2 cols
#---  plot:
plot(x, main="plot(x)")
plot(x, y, main="plot(x,y)")
#---  plot.ts:
plot.ts(x, main="plot.ts(x)")
plot.ts(x, y, main="plot.ts(x,y)")
#---  ts.plot:
ts.plot(x, main="ts.plot(x)")
ts.plot(ts(x), ts(y), col=1:2, main="ts.plot(x,y)")  # note- x and y are ts objects 

# filtering/smoothing by using a two-sided moving average
k = c(.5,1,1,1,.5)
(k = k/sum(k))
fjj = filter(jj, sides=2, k) 
plot(jj)
lines(fjj, col="red")
# performs the computations for the LOWESS smoother which uses locally-weighted polynomial regression
lines(lowess(jj), col="blue", lty="dashed")
