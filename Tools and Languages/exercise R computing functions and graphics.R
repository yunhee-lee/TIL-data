# Function Practice ####
# 산술평균을 구할 수 있는 함수 만들기
d.mean <- function(data){
  sum(data) / length(data)
}
# 정규 분포에서 1,000개의 sample을 추출
x <- rnorm(1000, mean=3, sd=1.5)
d.mean(x)

# fix()를 활용한 함수 정의
d.var(x)
fix(d.var)



# Graphics Practice - 범주형 단변수 자료 ####
library(MASS)
head(Cars93) # incl. 1993년 미국에서 판매되는 93종의 자동차에 대한 여러 정보

# Bar Chart
tab <- with(Cars93, table(Type))
barplot(tab, main="Type of Car", xlab="Type", ylab="Number of Car"
        , col=1:6, legend=c('Compact', 'Large', 'Midsize', 'Small','Sporty', 'Van')
        , nanmes.arg=c('Compact', 'Large', 'Midsize', 'Small','Sporty', 'Van'))

tab2 <- with(Cars93, xtabs(~Type+AirBags))
barplot(tab2, main="Type of Car", xlab="AirBags", ylab="Number of Car"
        , col=rainbow(6), legend=c('Compact', 'Large', 'Midsize', 'Small','Sporty', 'Van')
        , beside=TRUE) # beside=FALSE 설정하면, 누적 그래프로 작성

# Pie Chart
pie(tab)
names(tab) <- c('Compact', 'Large', 'Midsize', 'Small','Sporty', 'Van')
pie(tab, col=topo.colors(6))

# Histogram
with(Cars93, hist(MPG.highway, xlab='MPG in Highway', main='MPG in Highway'))

# Graphics Practice - 연속형 단변수 자료 ####
# Density Plot
library(vcd)
summary(Arthritis)
with(Arthritis, plot(density(Age)))

with(Cars93, hist(MPG.highway, xlab='MPG in Highway', main='MPG in Highway', probability=TRUE))
with(Cars93, lines(density(MPG.highway), col='red', lwd=2))

# Quantile-Quantile Plot
with(Cars93, qqnorm(Turn.circle, main='Q-Q plot of Turn.circle \n (U-turn space, feet)'))
with(Cars93, qqline(Turn.circle, col='Orange', lwd=2))



# Graphics Practice - 연속형 단변수와 범주형 단변수 자료의 표현 ####
# Box Plot
# 하나의 연속형 변수를 가지고도 그릴 수 있음
boxplot(Min.Price ~ AirBags, data=Cars93)
# 개별 값을 확인하기 위해 [] 추가
boxplot(Min.Price ~ AirBags, data=Cars93)[]
# 색상지정
boxplot(Min.Price~AirBags, data=Cars93
      , col=c("orange", "cyan", "yellow"), ylab="Minimum Price", xlab="Airbag"
      , ylim=c(0, 50), boxwex=0.25)

# ggplot2 library 활용
library(ggplot2)
# jitter 포함해서 개별 관측 값 확인
qplot(AirBags, Min.Price, data=Cars93, geom=c("boxplot", "jitter"), fill=AirBags
    , ylab="Minimum Price", xlab="Airbags", alpha=I(.2))
p <- ggplot(Cars93, aes(x=AirBags, y=Min.Price)) +
  geom_boxplot(aes(fill=AirBags))+
  # viridis color palettes 사용에 대한 option 추가
  scale_fill_viridis_d()
p

p + theme(legend.position="none") +
  xlab("Airbags") + ylab("MinimumPrice")

# Pirate Plot
library(yarrr)
# Boxplot에서 보여주는 정보와 더불어 데이터의 분포까지 볼 수 있음
pirateplot(formula=Price~AirBags, point.o=0.1, data=Cars93
           , main="Price by AirBag type", inf.method='iqr')
pirateplot(formula=MPG.city~Origin+DriveTrain, point.o=0.5, data=Cars93
           , main="City MPG by Origin and Drive Train", inf.method='iqr')

# Density Plot - ggplot2 library
ggplot(Cars93, aes(x=MPG.highway)) +
  geom_density(aes(group=Type, colour=Type)) +
  labs(x="MPG.highway", y="Density") +
  ggtitle("Density of MPG in Highway by Type") +
  theme(plot.title=element_text(hjust=0.5)) +
  theme_bw() # 더하면 바탕 색 하얗게 변경

# ggplot2 패키지 함수의 그래프 배열
# gridExtra library 사용
# grid.arrange(p1, p2, ncol=2)

# Spinogram
library(vcd)
with(Arthritis, spine(Improved~Age, breaks=quantile(Age)))



# Graphics Practice - 다변수 자료의 요약 ####
# Scatter Plot
with(Cars93, plot(Price, MPG.city
                  , main="price vs MPG.city"
                  , xlab="Price", ylab="MPG in City", pch=19))
with(Cars93, abline(lm(MPG.city~Price), col="red", lwd=2))
with(Cars93, lines(lowess(Price, MPG.city), col="blue", lwd=2))
legend(40, 40, lty=1, col=c("red", "blue"), c('regression', 'lowess')
                            , lwd=2, bty='n')
# Multiple Scatterplot
dat1 <- subset(Cars93, select=c(Min.Price, Max.Price, MPG.city, MPG.highway))
dat1
pairs(dat1)

# Scatterplot by group
with(Cars93, plot(Price, MPG.city, xlab='Price', ylab='MPG in City', type='n'))
with(subset(Cars93, DriveTrain=='Front'), points(Price, MPG.city, col='orange', pch=19))
with(subset(Cars93, DriveTrain=='Rear'), points(Price, MPG.city, col='firebrick', pch=17))
with(subset(Cars93, DriveTrain=='4WD'), points(Price, MPG.city, col='black', pch=8))
legend("topright", legend=c('Front', 'Rear', '4WD'),
       col=c('orange', 'firebrick', 'black'), pch=c(19, 17, 8), bty='n')

# Scatterplot by group - ggplot2 facet option
qplot(Wheelbase, Width, data=Cars93, shape=Type, color=Type,
      facets=Origin~AirBags, size=I(2), xlab="Wheelbase", ylab="Car Width")


# Mosaic Plot
library(vcd)
# 교차표 생성
art <- xtabs(~Treatment+Improved, data=Arthritis, subset=Sex=="Female")
art
mosaic(art, gp=shading_max)

mosaic(~Sex+Age+Survived, data=Titanic,
       main="Survival on the Titanic", shade=TRUE, levend=TRUE)

