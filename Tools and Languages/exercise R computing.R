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



# Data Structure - vector, matrix ####
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
v1[v1>18] # 19 20
v1[c(-2, -4)] # 11 13 15 16 17 18 19 20
# replace() 일부 자료 대체
v2 <- c(3:7)
replace(v2, 2, 10) # 3 10 5 6 7
# append() 조건에 따른 위치에 자료 삽입
# v2의 다섯 번재 값 다음에 10을 추가
append(v2, 10, after=5) # 3 4 5 6 7 10
# sort() 자료 정렬
x <- c(rep(3, 3), seq(3, 7, 2), rev(seq(3, 7, length=3)), rep(4, 3)) # 3 3 3 3 5 7 7 5 3 4 4 4
sort(x) # 3 3 3 3 3 4 4 4 5 5 7 7
# rank() 자료의 순위 출력
# 별도 조건을 지정하지 않을 경우, 순위값의 평균값을 부여
rank(x) # 3.0 3.0 3.0 3.0 9.5 11.5 11.5 9.5 3.0 7.0 7.0 7.0
# order() 오름차순에 의한 자료의 위치값 출력
order(x) # 1  2 3 4 9 10 11 12 5 8 6 7

# Handling Matrix
# Creating a matrix
matr <- matrix(1:9, nrow=3)
matr
length(matr) # 9
mode(matr) # "numeric"
dim(matr) # 3 3
r1 <- c(1, 2, 3); r2 <- c(4, 5, 6); r3 <- c(7, 8, 9)
rbind(r1, r2, r3)
m1 <- 1:9 # ':' 만으로도 c(1:9)와 동일한 기능을 수행
dim(m1) <- c(3, 3)
m1
matr2 <- matrix(c(1:9), ncol=3, byrow=T) # byrow=T Option을 통해 행 기준 3열의 행렬 생성
matr2[1,] # 1 4 7
matr2[,3] # 3 6 9
matr2[2, 3] # 6
matr2[matr2[,3]>4, 2] # 3열에서 4보다 큰 행의 값 중 2열의 모든 값
# Operating a matrix - apply(), sweep()
# apply() 함수를 활용한 연산
Height <- c(140, 155, 142, 175)
size.1 <- matrix(c(130, 26, 110, 24, 118, 25, 112, 25), ncol=2, byrow=T,
                 dimnames=list(c("Lee", "Kim", "Park", "Choi"), c("Weight", "Waist")))
size <- cbind(size.1, Height)
colmean <- apply(size, 2, mean) # 2 : 열 평균 값을 계산, 1 : 행 평균 값을 계산
colmean # Weight 117.5 Waist 25.0 Height 153.0
# sweep() 함수를 활용한 연산 - 기본 연산은 minus로 지정되어 있음
sweep(size, 2, colmean)
sweep(size, 1, c(1, 2, 3, 4), "+") # size 각 행의 값에 c(1, 2, 3, 4) 값을 더해 줌



# Data Structure - array, list, data frame ####
# Array : 행렬을 2차원 이상으로 확장시킨 객체
# 일반적으로는 3차원 이상의 데이터 객체를 배열이라고 함
# mode() - 자료의 형태
# dim() - 각 차원 벡터의 크기
# 배열의 경우, 행/열 그리고 행렬번호 포함
# dimnames() - 각 차원 리스트의 이름
# array(data, dim=c(행의 개수, 열의 개수, 행렬의 개수, ...), dim.names=NULL)
arr <- array(1:24, c(3, 3, 2)) # 1-18까지의 자료 생성
# 아래 함수를 통해 각 차원의 이름을 지정
dimnames(arr) <- list(paste("row", c(1:3)),
                      paste("col", c(1:3)),
                      paste("ar", c(1:2)))
# length() - 자료의 개수
length(arr)
dt <- 1:40
dim(dt) <- c(5, 4, 2)
dt
# 1-6의 자료로 1차원 배열 생성 (not a vector)
array(1:6)
array(1:6, c(2:3))
# 배열의 연산은 각 원소의 위치 단위로 시행
ary1 <- array(1:8, c(2, 2, 2))
ary2 <- array(16:24, c(2, 2, 2))
ary1 + ary2
ary1 * ary2
# %*% matrix와 array의 경우가 다름
# 두 배열 원소들의 곱의 합
ary1 %*% ary2
# 배열 원소의 추출 및 삭제
ary1[,,1]
ary1[1,1,] # 1 5
ary1[1,,-2] # 1 3
ary1[1,,1] # 위 결과와 동일

# List : 서로 다른 형태(mode)의 데이터로 구성된 객체
# 형태뿐 아니라, 길이도 다를 수 있음
a <- 1:10
b <- 11:15
klist <- list(vec1=a, vec2=b, descrip="example")
length(klist) # 원소가 아닌! 자료의 개수! 
vlist <- list(a, b, "example")
klist[[1]]; klist$vec1;
vlist[[1]];
klist[[1]][3]; klist$vec1[3];
list1 <- list("A", 1:8)
list1[[3]] <- list(c(T, F)) # 세 번째 성분을 추가
list1[[2]][9] <- 9 # 두 번째 성분에 원소 추가
list1

# Data Frame : 각 열들이 서로 다른 형태의 객체를 가질 수 있음
# 형태(mode)가 일반화된 행렬(matrix)
# Data Frame이라는 하나의 객체에 여러 종류의 자료가 들어갈 수 있음
# Data Frame의 각 열은 각각 변수와 대응
# 분석이나 모형 설정에 적합한 자료 객체
# read.table() 함수를 이용하여 외부 텍스트 파일을 불러들일 수 있음
# data.frame() 함수를 이용하여 여러 종류의 자료 객체들을 서로 결합
# as.data.frame() 함수를 사용하여 다른 형태의 자료객체를 데이터 프레임의 형태로 변환
d2 <- read.table("~/Work/TIL-data/Tools and Languages/Sample Data/dat_exam2.txt", header=T)
char1 <- rep(LETTERS[1:3], c(2, 2, 1))
num1 <- rep(1:3, c(2, 2, 1))
test1 <- data.frame(char1, num1)
a1 <- c("a", "b", "c", "d", "e", "f", "g", "h")
dim(a1) <- c(2, 4)
test2 <- as.data.frame(a1)
# Data Frame의 결합 : cbind(), rbind(), merge()
# rbind() 결합 시, 변수 명이 동일해야 함ㅍ
# cbind() 열의 개수가 일치해야 함
# merge() : 왼쪽의 변수 값을 기준으로 Matching, 교집합을 남기는 구조



# R Programming Language - operator ####
# R 활용 통해 통계 분석뿐 아니라, 반복문, 조건문 등을 이용한 프로그래밍 가능
# 산술 연산자의 경우, 기본적으로 component-wise로 실행됨 : +, -, *, /, ^
# 정수 나눗셈 연산자 %/% - 몫의 정수 부분만
A <- matrix(c(1, 2, 3, 4), ncol=2)
B <- matrix(c(3, 4, 5, 6), ncol=2)
B%/%A
A%/%B # 모든 원소가 0
# 행렬의 곱셈연산자 %*% - 수학적 곱셈 (not component-wise)
# (참고) 회귀 계수를 구할 때 활용
# (참고) 역행렬은 solve() 함수를 통해 구함

# 비교 연산자
# == : 비교되는 두 항이 같은지를 비교
# != : 비교되는 두 항이 다른지를 비교
# <= : 왼쪽 항이 오른쪽 항보다 작거나 같은지를 판단
# < : 왼쪽 항이 오른쪽 항보다 작은지 판단

# 논리 연산자
# &&, & : &&는 일반적인 AND 논리 연산자이고, &는 벡터에서의 AND 논리 연산자
2==2 && 3>4 # FALSE
2==2 && c(2==2, 3>4) # TRUE - 벡터의 첫 번재 값만 비교
2==2 & c(2==2, 3>4) # TRUE FALSE
# ||, | : ||는 일반적인 OR 논리연산자이고, |는 벡터에서의 OR 논리 연산자
2!=2 || c(2==2, 3>4) # TRUE - 벡터의 첫 번째 값만 비교
2!=2 | c(2==2, 3>4) # TRUE FALSE

# 집합 연산자
# 벡터를 원소로 이루어진 집합으로 볼 때, 수학적인 정의에 따른 다양한 집합연산을 실시할 수 있음
x <- c(1, 2, 5)
y <- c(5, 1, 7, 8)
union(x, y) # 1 2 5 7 8
intersect(x, y) # 1 5
# setdiff(), setequal() : 집합 x와 y의 차집합, 같은지 여부 판단 - 차집합의 경우 x, y의 위치 중요!
setdiff(x, y) # 2
setdiff(y, x) # 7 8
setequal(x, y) # FALSE
# %in%, choose() : %in%는 특정 원소가 집합에 속하는지를 판단
# choose(n, k)는 n개의 원소로 이루어진 집합에서 추출 가능한 k개의 원소로 이루어진 부분집합의 수를 계산 = 조합의 수
5 %in% x # TRUE
choose(5, 2) # 10
