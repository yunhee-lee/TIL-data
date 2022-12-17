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

ggplot(data = abalone, aes(x = length,y = wholew)) +
  geom_point(aes(color = sex, shape = sex, alpha = 0.1))

# Data point가 너무 많을 경우 활용할 수 있는 방법 :
ggplot(data = abalone, aes(x = sex, y = wholew)) +
  geom_jitter(alpha  = 0.5)

ggplot(data = abalone, aes(x = wholew)) +
  geom_histogram(binwidth = 0.05) +
  facet_wrap(~sex, ncol = 1)

ggplot(data = abalone, aes(x = wholew)) +
  geom_density(aes(color = sex,
                   linetype = sex))

# 영역을 면적 형태로 표시하고 싶을 경우, fill option 사용, alpha 힘께 지정해서 가려지는 부분이 없도록 할 것
# 범주 간 분포를 비교하려고 할 때, 사용
ggplot(data = abalone, aes(x = wholew)) +
  geom_density(aes(color = sex, linetype = sex, fill = sex, alpha = 0.5))

# 여러 그래프 함께 그리기 (층화) ####
# (참고) color = sex option을 어디에 위치시키는지에 따라 분류 적용 형태가 달라짐
ggplot(data = tips, aes(x = total_bill, y = tip, color = sex)) +
  geom_point() +
  geom_smooth()

# 산점도에 통계량을 이용한 점찍기
plot.stat <- ggplot(abalone, aes(x = rings, y = log(wholew)))
plot.stat + geom_point(shape = 1) +
  stat_summary(size = 3, shape = 15, color = "red",
               fun = "mean", geom = "point")

q1 <- function(x) quantile(x, p = 0.25)
q3 <- function(x) quantile(x, p = 0.75)
plot.stat +
  stat_summary(aes(color = "Q1", shape = "Q1"), fun = q1, geom = "point") +
  stat_summary(aes(color = "Q3", shape = "Q3"), fun = q3, geom = "point") +
  stat_summary(aes(color = "median", shape = "median"), fun = median, geom = "point") +
  stat_summary(aes(color = "min", shape = "min"), fun = min, geom = "point") +
  stat_summary(aes(color = "max", shape = "max"), fun = max, geom = "point") +
  scale_color_hue("Qaurtile") +
  scale_shape("Qaurtile")

