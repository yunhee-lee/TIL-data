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

# factor 변환하지 않아도, y 값에 해당하는 변수를 범주형으로 인식해서 상자그림 생성
bwplot(cylinder ~ mpg, data = autompg)
bwplot(as.factor(cylinder) ~ mpg, data = autompg)

# horizontal option에 따라 범주형 변수 인식이 달라짐
bwplot(weight ~ cylinder, data = autompg, horizontal = FALSE)

# Dot Plot ####
dotplot(cylinder ~ mpg, data = autompg)

# Mosaic ####
# 두 변수 모두 범주형 변수인 경우
# vcd package 활용 (install 필요)
library(vcd)
mosaic(~ sex + size, data = tips)

# 범주형 변수가 세 개인 경우
cotabplot(~ size + sex | smoker, data = tips)

# 다변량 그래프 ####
# 산점도 행렬
splom(~ autompg[, c(1, 3:6)], data = autompg)
# 시각화 상세 설정 적용 시,
splom(~ autompg[, c(1, 3:6)], groups = cylinder,
      data = autompg,
      col = c("red", "orange", "blue", "green", "grey50"),
      pch = c(16, 2, 15, 3, 1), cex = 0.7,
      # 범례 지정을 위한 함수
      key = 
        list(title = "Various cylinders in autompg",
             colums = 5,
             points = list(pch = c(16, 2, 15, 3, 1),
                           col = c("red", "orange", "blue", "green", "grey50")),
             text = list(c("3", "4", "5", "6", "8"))))

# 평행좌표그림
# 전체적인 경향성을 확인할 수 있음
parallelplot(~ autompg[, c(1, 3:6)],
             data = autompg, horizontal = FALSE)
