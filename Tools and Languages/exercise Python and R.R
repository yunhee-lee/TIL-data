aaa <- function(x) {
  s1 <- 0
  s2 <- 0
  for(i in x) {
    s1 = s1 + i
    s2 = s2 + i^2
  }
  res = list(sum1 = s1, sum2 = s2)
  return(res)
}

x = c(1:10)
aaa(x)

score = read.csv("~/Work/TIL-data/Tools and Languages/Sample Data/rpy/score.csv")
head(score,5)

# Python과 R 과제 : 이윤희 202235-367728
x1 <- c('kim', 'lee', 'park')
x2 <- c(170, 160, 180)
x3 <- c(60, 55, 75)
df <- data.frame(name = x1, height = x2, weight = x3)
kims <- array(df[1, c('height', 'weight')])
kims

# Python과 R 과제 : 이윤희 202235-367728
mywage <- function(whour) {
  g_wage <- 10000
  ot_wage <- g_wage *1.5
  ot_after = 40
  if (whour <= 40) {
    wage = whour * g_wage
  }
  else if (whour > 40) {
    wage = (ot_after * g_wage) + ((whour - ot_after) * ot_wage)
  }
  else {
    print("error")
  }
  return(wage)
}
mywage(52)

# [공통3] 교재 연습문제 8장(p. 268) - 2번 (배점 12점) ####
nutrient2 = read.csv("~/Work/TIL-data/Tools and Languages/Sample Data/nutrient2.csv", row.names = 1)
head(nutrient2)

nutrient_nan = nutrient2/0
colSums(is.na(nutrient_nan))


library(dplyr)
nutrient_drop <- nutrient_nan %>% filter(is.na(calcium) | is.na(iron) | is.na(protein) | is.na(vitaminA) | is.na(viataminC))
nutrient_modi <- nutrient2 %>% filter(!calcium == 0 & !iron == 0 & !protein == 0 & !vitaminA == 0 & !viataminC == 0)
nutrient_modi

# 요약 통계량 구하기
summary(nutrient_modi)

calcium_sd <- sd(nutrient_modi$calcium)
iron_sd <- sd(nutrient_modi$iron)
protein_sd <- sd(nutrient_modi$protein)
vitaminA_sd <- sd(nutrient_modi$vitaminA)
viataminC_sd <- sd(nutrient_modi$viataminC)
cat(calcium_sd, iron_sd, protein_sd, vitaminA_sd, viataminC_sd)

# 상자그림 그리기
par(mfrow=c(1, 5))
boxplot(nutrient_modi$calcium)
title("calcium")
boxplot(nutrient_modi$iron)
title("iron")
boxplot(nutrient_modi$protein)
title("protein")
boxplot(nutrient_modi$vitaminA)
title("vitaminA")
boxplot(nutrient_modi$viataminC)
title("viataminC")

#히스토그램 그리기
par(mfrow=c(5, 1))
hist(nutrient_modi$calcium)
hist(nutrient_modi$iron)
hist(nutrient_modi$protein)
hist(nutrient_modi$vitaminA)
hist(nutrient_modi$viataminC)
