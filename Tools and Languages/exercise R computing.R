# Data Handling ####
x <- c(1, 2, 3, 4, 5)
y <- c(10, 20, 30, 40, 50)

# 벡터 x, y column binding을 통해 object 생성
dat <- cbind(x, y)

# scan() 함수를 이용한 데이터 입력
w1 <- scan()

# edit() 함수를 이용한 입력
# (참고) m1 Mac 사용 시, rosetta 설치 후 'XQuartz' package intsall 필요
# https://www.xquartz.org/
dat3 <- data.frame()
dat3 = edit(dat3)

# sink() 함수를 활용한 출력 결과 파일 저장
# 파일은 working directory(wd)에 저장
# 첫번째 sink() 실행 시 파일 생성되며,
# 이후 command line 실행 시마다 파일이 업데이트
sink('printa.txt')
# R package 내장 data set 사용
summary(iris)
sink()

# write.csv() / write.table() 함수를 이용한 데이터 저장
# write.table() 함수는 공백을 구분자로 설정
write.csv(dat3, '~/Work/TIL-data/Tools and Languages/Sample Data/dat_exam1.csv')
write.table(dat3, '~/Work/TIL-data/Tools and Languages/Sample Data/dat_exam2.txt')
write.table(dat3, '~/Work/TIL-data/Tools and Languages/Sample Data/dat_exam3.txt', sep=',')

# read.csv() 함수를 이용해서 데이터 불러오기
# header=T 기본 option이므로 생략 가능
datr <- read.csv('~/Work/TIL-data/Tools and Languages/Sample Data/dat_exam1.csv', header=T, stringsAsFactors=F)
head(datr)
# 데이터 구조 확인
str(datr)

# na.strings option을 이용한 결측치 지정
nadat <- read.table('~/Work/TIL-data/Tools and Languages/Sample Data/dat_exam2.txt', na.strings='a', header=T)
nadat

# 현재 만들어진 object 확인
ls()
# 객체 지우기
rm(nadat)
rm(list=ls())