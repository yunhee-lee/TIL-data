# Preparing data sets ####
autompg <- read.table("~/Work/TIL-data/Tools and Languages/Sample Data/auto-mpg.data", na.string="?")
head(autompg)
colnames(autompg) = c("mpg", "cylinder", "displacement",
                      "horsepower", "weight", "accelaeration",
                      "year", "origin", "name")
dim(autompg)
head(autompg)

library(reshape2)
data(tips)
head(tips)
tips$tiprate <- tips$tip / tips$total_bill * 100
head(tips)

abalone <- read.table("~/Work/TIL-data/Tools and Languages/Sample Data/abalone.data", sep = ",")
colnames(abalone) = c("sex", "length", "diameter",
                      "height", "wholew", "shuckedw",
                      "visceraw", "shellw", "rings")
head(abalone)

# Bar plot ####
library(lattice) # R 기본 함수로 별도 install 불필요
barchart(as.factor(autompg$cylinder))
barchart(as.factor(autompg$cylinder), horizontal = FALSE)

# Histogram ####
histogram(tips$tip)
histogram(tips$tip, breaks = seq(0, 11, 0.5),
          main = "binwidth = 50 cent")

# Density Plot ####
densityplot(autompg$mpg, xlab = "mpg")

# Scatter Plot ####
xyplot(tip ~ total_bill, pch = 16, data = tips)
# bar(|)를 넣어주면, 범주를 구분하여 데이터 생성함
xyplot(tip ~ total_bill | sex, pch = 16, data = tips)
# group 설정 시 같은 그래프 내에서 색상으로 범주가 구분되며, point shape도 변경 가능
xyplot(tip ~ total_bill | sex, group = smoker, pch = c(16, 2), data = tips)
xyplot(tip ~ total_bill | sex + smoker, data = tips,
       # Panel에 대한 각종 설정 값을 함수 혈태로 만들어서 적용
       panel = function(x, y){
         # 그리드 어떻게 구성할지 설정
         panel.grid(h = -1, v = 2)
         panel.xyplot(x, y, pch = 16)
         panel.lmline(x, y)
       })
