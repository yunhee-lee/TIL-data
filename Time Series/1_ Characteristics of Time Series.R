# https://github.com/nickpoison/tsa4/blob/master/textRcode.md#chapter-1
library(astsa)
data()

# plotting time series data ---- Example 1.1;1.2;1.3
tsplot(jj, col=4, type="o", ylab="Quarterly Earnings per Share")
tsplot(gtemp_land, col=4, type="o", ylab="Global Temperature Deviations")
tsplot(speech)

# ---- Example 1.4
library(xts) 
#diff (lagged differences) - returns suitably lagged and iterated differences 
djiar = diff(log(djia$Close))[-1]
plot(djiar, col=4, main="DJIA Returns")

# ---- Example 1.5
par(mfrow = c(2,1))  # set up the graphics
tsplot(soi, col=4, ylab="", main="Southern Oscillation Index")
tsplot(rec, col=4, ylab="", main="Recruitment")

# ---- Example 1.6
par(mfrow=c(2,1))  
tsplot(fmri1[,2:5], col=1:4, ylab="BOLD", main="Cortex", spaghetti=TRUE)
tsplot(fmri1[,6:9], col=1:4, ylab="BOLD", main="Thalamus & Cerebellum", spaghetti=TRUE)
# each separately (not in text)
tsplot(fmri1[,2:9], col=1:8, lwd=2, ncol=2, ylim=c(-.6,.6))
# and another view (not in text)
x     = ts(fmri1[,4:9], start=0, freq=32)         
names = c("Cortex","Thalamus","Cerebellum")
u     = ts(rep(c(rep(.6,16), rep(-.6,16)), 4), start=0, freq=32) # stimulus signal
par(mfrow=c(3,1))
for (i in 1:3){ 
  j = c(1,3,5)[i]
  tsplot(x[,j:(j+1)], ylab="BOLD", xlab="", main=names[i], col=5:6, ylim=c(-.6,.6), 
         lwd=2, xaxt="n", spaghetti=TRUE)
  axis(seq(0,256,64), side=1, at=0:4)
  lines(u, type="s", col=gray(.3)) 
}
mtext("seconds", side=1, line=1.75, cex=.9)

# ---- Example 1.7
par(mfrow=2:1)
tsplot(EQ5,  col=4, main="Earthquake")
tsplot(EXP6, col=4, main="Explosion")



