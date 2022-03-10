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



# Data Structure ####
# Creating vectors
# seq() 함수를 이용한 벡터 생성
# from, to, by 매개 변수가 지정되면 작성 순서 관계 없음
seq(from=3, to=7, by=1)
seq(to=7, from=3, by=1)
# 생략 시 from, to, by 순서로 인식
seq(3, 7, 1)
# seq() 함수에 조건 지정
# length로 조건을 지정할 경우, 시작값과 종료값 사이를 등간격으로 나누어 벡터 생성
seq(from=3, to=7, length=3) # 3 5 7
seq(from=3, to=7, length=4) # 3.000000 4.333333 5.666667 7.000000
# along으로 수열을 지정하게 되면, 해당 수열에 따라 동일한 크기의 벡터 생성
seq(from=1, to=5, along=1:6) # 1.0 1.8 2.6 3.4 4.2 5.0
seq(from=1, by=0.05, along=1:7) # 1.00 1.05 1.10 1.15 1.20 1.25 1.30
# rep() 함수를 이용한 벡터 생성
rep(c(1, 2), times=2) # 1 2 1 2
rep(c(2, 4), times=c(1, 4)) # 2 4 4 4 4
rep(c(1, 3), each=2) # 1 1 3 3
rep(c(2, 4, 8), length=5) # 2 4 8 2 4

# Editing vectors
v1 <- c(11:20)
v1[c(3, 5)] # 13 15
v1[v1>18] # 19 20ß
v1[c(-2, -4)] # 11 13 15 16 17 18 19 20
# replace() 일부 자료 대체
v2 <- c(3:7)
replace(v2, 2, 10) # 3 10  5  6  7
# append() 조건에 따른 위치에 자료 삽입
# v2의 다섯 번재 값 다음에 10을 추가
append(v2, 10, after=5) # 3  4  5  6  7 10
# sort() 자료 정렬
x <- c(rep(3, 3), seq(3, 7, 2), rev(seq(3, 7, length=3)), rep(4, 3)) # 3 3 3 3 5 7 7 5 3 4 4 4
sort(x) # 3 3 3 3 3 4 4 4 5 5 7 7
# rank() 자료의 순위 출력
# 별도 조건을 지정하지 않을 경우, 순위값의 평균값을 부여
rank(x) # 3.0  3.0  3.0  3.0  9.5 11.5 11.5  9.5  3.0  7.0  7.0  7.0
# order() 오름차순에 의한 자료의 위치값 출력
order(x) # 1  2  3  4  9 10 11 12  5  8  6  7



