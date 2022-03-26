# Distribution
## 이산형 확률분포
### 이항분포 (binomial distribution)
* 실험(조사)의 결과가 어떻게 될지 사전에 알 수 없지만 모든 가능한 결과가 두 가지이고 반복됨 (e.g. 동전을 5번 던질 때 앞면의 수, 공장에서 생산된 제품 100개를 검사할 때 발견되는 불량품의 수)

* 이항분포 관련 개념
	* 베르누이 시행 : 각 실험의 결과가 두 가지만 가능한 시행
		* e.g. 제품 검사로 불량품과 양호품으로 구분하는 경우, 유권자에게 특정 후보에 대한 지지 여부를 묻는 경우
		1. 각 시행의 결과는 성공 아니면 실패
		2. 성공확률 p는 시행마다 동일
		3. 각 시행은 독립 → 즉, 어떤 시행 결과는 그 이후의 결과에 전혀 영향을 미치지 않음
	* 시행 : 같은 실험을 반복할 때 각각의 실험
	* 독립시행 : 앞이 결과가 뒤의 결과에 영향을 미치지 않음
* 각 시행에서 성공률이 p인 베르누이 시행을 n번 독립 시행

* X = ‘n번의 베르누이 독립시행에서 얻은 총 성공 횟수’
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20X%20%5Csim%20%5Cbeta%28n%2C%20p%29%5C%5C%20P%28X%20%3D%20x%29%20%3D%20%7Bn%20%5Cchoose%20x%7Dp%5Ex%281-p%29%5E%7B1-x%7D)
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbegin%7Balign*%7D%20%26%20E%28X%29%20%3D%20np%20%5C%5C%20%26%20np%281-p%29%20%5Cend%7Balign*%7D)

### 초기하분포
* 전체 N개인 모집단이 ‘1’ 또는 ‘0’ 등 두 가지로 분류

* 확률변수 X = “전체 N개 중 1이 D개, 0이 N-D개로 구성된 유한모집단에서 크기 n인 랜덤표본을 뽑을 때 1이 나오는 수”
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbegin%7Balign*%7D%20P%28X%3Dx%29%3D%5Cfrac%7B%7BD%20%5Cchoose%20x%7D%7BN-D%20%5Cchoose%20n-x%7D%7D%7B%7BN%20%5Cchoose%20n%7D%7D%20%5Cend%7Balign*%7D)
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbegin%7Balign*%7D%20%26%20E%28X%29%20%3D%20np%20%5C%5C%20%26%20np%281-p%29%20%5Cfrac%7BN-n%7D%7BN-1%7D%20%5Cend%7Balign*%7D)
* 만약 N이 매우 크면 수정계수 ![수정계수](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7BN-n%7D%7BN-1%7D)는 1에 가까워 지며, 따라서 초기하분포의 분산은 이항분포의 분산으로 근사

### 포아송 분포
* 발생 확률이 아주 작은 희귀한 사건의 수에 대한 확률분포에 이용 범위가 한계로서 주어지지 않은 경우

* 포아송분포 적용을 위한 가정
	* 독립성 - 서로 다른 단위에서 출현하는 횟수는 서로 독립
	* 비직랍성 - 극히 작은 단위에서 둘 이상이 일어날 확률은 매우 작음 (희귀함)
	* 비례성 - 단위시간이나 공간에서 성공의 평균 출현 횟수는 일정
* 단위당 평균 발생률이 m인 어떤 현상에 대해서..
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbegin%7Balign*%7D%20P%28X%3Dx%29%20%3D%20%5Cfrac%7Be%5E%7B-m%7Dm%5E%7Bx%7D%7D%7Bx%21%7D%20%5Cend%7Balign*%7D)
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbegin%7Balign*%7D%20%26%20E%28X%29%20%3D%20m%20%5C%5C%20%26%20Var%28X%29%20%3D%20m%20%5Cend%7Balign*%7D)

## 연속형 확률분포
### 정규분포 (normal distribution)
* ![정규분포](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20X%20%5Csim%20N%28%5Cmu%2C%20%5Csigma%5E2%29) → 확률변수 ![X](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20X)는 평균 ![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu), 표준편차 ![sigma](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Csigma)인 정규분포를 따른다
* 분포의 모양은 ![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu)와 ![sigma](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Csigma)의 값에 의해 결정됨
	* ![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu) 값을 중심으로 좌우 대칭
	* ![sigma](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Csigma) 값에 따라 평균 주위에 얼마나 집중적으로 분포하는지 (종 모양) 달라짐
### 표준 정규 분포 $N(0, 1)$
* ![X](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20X)가 평균이 ![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu)이고, 분산이 ![sigma-squared](https://latex.codecogs.com/gif.latex?%5Csigma%5E2)인 정규분포  ![정규분포](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20X%20%5Csim%20N%28%5Cmu%2C%20%5Csigma%5E2%29)일 때, 변환 ![표준화](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20Z%20%3D%20%5Cfrac%7BX%20-%20%5Cmu%7D%7B%5Csigma%7D)는 평균이 0이고, 표준편차가 1인 표준정규분포 N(0, 1)을 따름
* 정규분포의 확률은 히스토그래믜 면적을 통해서 계산하는데.. 이 적분이 매우 구하기 어렵기 때문에 **정규분포표**를 활용 (R 등 통계 SW 활용)
* [8.4 정규분포와 중심극한정리 — 데이터 사이언스 스쿨](https://datascienceschool.net/02%20mathematics/08.04%20%EC%A0%95%EA%B7%9C%EB%B6%84%ED%8F%AC%EC%99%80%20%EC%A4%91%EC%8B%AC%EA%B7%B9%ED%95%9C%EC%A0%95%EB%A6%AC.html)

## 표본분포
* 통계적 추론 (statistical inference) : 모집단에서 추출한 표본을 이용하여 모집단에 관한 추측이나 결론을 이끌어내는 과정
* 모수 (parameter) : 모집단의 특성값 (e.g. 평균, 비율, 분산 등)
* 랜덤표본 (random sample) : 모집단에서 랜덤하게 추출된 일부로 서로 독립이며 동일한 분포를 따름
* 표본추출변동 : 통계량이 표본에 따라 달라지는 것
* **표본분포 (sampling distribution) : 표본 통계량의 분포**
	* 표본분포는 표본으로부터 계산되는 통계량과 모수 사이의 관계를 규명해 주기 때문에, 모수의 추정과 검정을 가능하게 함

## 표본평균의 분포
* 모집단의 분포가 정규분포가 ![equation](https://latex.codecogs.com/gif.latex?N%28%5Cmu%2C%20s%5E2%29)일 때, 표본 크기 n인 랜덤표본의 표본평균 ![x-bar](https://latex.codecogs.com/gif.latex?%5Cbar%7BX%7D)는 정규분포 ![equation](https://latex.codecogs.com/gif.latex?N%28%5Cmu%2C%20%5Cfrac%7Bs%5E2%7D%7Bn%7D%29)를 따름
### 중심극한정리 (central limit theorem)
* 평균이 ![x-bar](https://latex.codecogs.com/gif.latex?%5Cmu)이고, 분산이 ![sigma-squared](https://latex.codecogs.com/gif.latex?%5Csigma%5E2)인 임의의 모집단에서 표본의 크기 n이 충분히 크면 (모집단의 분포가 정규분포가 아니더라도) 표본평균 ![x-bar](https://latex.codecogs.com/gif.latex?%5Cbar%7BX%7D)의 분포는 정규분포를 따름 :
* ![equation](https://latex.codecogs.com/gif.latex?%5Cbar%7BX%7D%20%5Csim%20N%28%5Cmu%2C%20%5Cfrac%7Bs%5E2%7D%7Bn%7D%29)
### 이항분포의 정규근사
* 이항분포 ![이항분포](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbeta%28n%2C%20p%29)를 따르는 확률변수 X는 n이 클 때 근사적으로 정규분포 ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20N%28np%2C%20np%281-np%29%29)를 따름
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7BX-np%7D%7B%5Csqrt%7Bnp%281-p%29%7D%7D%20%5Csim%20N%280%2C%201%29)
	* (예제) 생산되는 제품의 불량률이 5%인 한 공장에서 어느 날 제품 100개를 표본추출했다고 할 때.. 불량품이 3개에서 7개일 확률

## t-분포
* 모분산을 알기 어려을 때, 표본분산(표본표준편차)으로 대치
* 모집단의 분포가 정규분포 ![정규분포](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20X%20%5Csim%20N%28%5Cmu%2C%20%5Csigma%5E2%29) 일 때,
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20t%20%3D%20%5Cfrac%7B%5Cbar%7BX%7D-%5Cmu%7D%7BS/%5Csqrt%7Bn%7D%7D%20%5Csim%20t_%7Bn-1%7D)
	* 이 때 ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20S%20%3D%20%5Csqrt%7B%5Cfrac%7B1%7D%7Bn%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%20%28X_%7Bi%7D-%5Cbar%7BX%7D%29%5E2%7D)
* 0에 대해서 좌우대칭이며, 자유도 n이 커지면 표준정규분포에 가까워짐

## 표본분산의 분포 (sampling distribution of sample variance)
* 일반적으로 표본분산의 분포는 모집단이 정규분포이고 모분산이 ![sigma-squared](https://latex.codecogs.com/gif.latex?%5Csigma%5E2)일 때, 표본분산의 분포는 카이제곱 분포 (![x-squared](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20x%5E2) distribution)를 따름
	* ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7B%28n-1%29S%5E2%7D%7B%5Csigma%5E2%7D%20%5Csim%20x%5E2%28n-1%29)

## F분포
* 정규분포를 따르는 두 모집단에서 독립적으로 추출한 표본들의 표본분산비의 확률분포
*  [F 분포 - 위키백과, 우리 모두의 백과사전](https://ko.wikipedia.org/wiki/F_%EB%B6%84%ED%8F%AC)