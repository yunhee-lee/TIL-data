# Estimation and Testing
## 추정의 이해
* **통계적 추론 : 표본의 관측값(데이터)으로 모집단의 모수를 추측, 판단하는 방법 → 통계적 사고의 기초**
* 추정(추측)과 검정(판단)
	* 추정 : 점추정, 구간추정
	* 추정의 예 - 여론조사
	* 검정의 예 - 비타민 C의 감기 예방효과
* 모집단 (population) : 알고 싶은 모든 개체의 집합
* 표본 (sample) : 모집단의 일부 - 임의 추출해서 모집단을 대표
* 확률변수 (random variable) : 모집단 특성 나타내는 변수 → 불확실(확률분포)
	* (참고) 데이터는 실제 관측값을 의미
* 확률분포 : 몇 개 모수를 가지는 수리적 함수
* 확률변수의 분포를 아는 것 → 모수(parameter)를 아는 것
> *모집단 확률변수의 분포는 몇 개 모수의 함수이므로, 모집단의 확률변수의 분포를 안다는 것은 모수를 아는 것으로 귀결된다.*  
* 확률변수의 모수
	* 이항분포 모비율 ![이항분포](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbeta%28n%2Cp%29)
	* 정규분포 : 모평균과 모분산 ![정규분포](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20N%28%5Cmu%2C%20%5Csigma%5E2%29)
> *그런데 모집단의 확률변수는 시간, 비용 등 제약이 있어 모두 측정하기 어려우므로 불확실하다. 따라서 모집단의 확률변수를 다 측정하기보다는 그 일부인 표본을 추출해서 측정하고, 측정된 데이터를 바탕으로 확률변수의 모수를 추정한다. 이때 모집단을 대표할 수 있도록 표본을 뽑아야 한다. 어떻게 모집단을 대표하는 표본을 뽑을까? 그 방법은 모집단의 구성 객체를 잘 섞은 후 임의로 추출해서 표본을 만들고, 그 표본의 변수를 측정하여 모집단의 확률변수의 분포와 관련된 모수를 추측하게 된다. 이는 마치 된장국의 간을 보기 위해 수저로 잘 저은 후 몇 숟가락의 맛으로 전체 국의 맛을 보는 것과 같은 이치이다.*  

```
🎃 표본으로부터 모집단을 추측하는 것을 통계적 추론(statistical inference)이라고 하는데, 추정(estimation)과 검정(testing)으로 구분
[추정] 통계량으로부터 모집단의 모수의 값을 찾는 방법
[검정] 모집단에 대한 모수에 대한 주장의 타당성을 표본의 통계량을 통해 점검
```

## 통계적 추정
```
✔️ 일반적으로 대문자는 확률변수를, 소문자는 데이터로부터 구한 추정값을 의미
```
* 표본(확률변수)으로 모집단의 모수를 추측
	* 모수는 고정된 상수이지만 알 수 없다고 가정
* 통계량(statistic) : 표본 확률변수의 함수
	* 모수를 추정하기 위한 도구 → 추정량 (estimator)
	* 추정값 : 추정량에 표본으로부터 측정된 관측값을 대입하여 얻은 추정량의 값
	* **표본분포(sampling distribution)** : 통계량의 분포
		* 추정량은 확률변수의 함수이므로 그 나름의 분포를 가짐
* 점추정 (point estimation)
* 구간추정 (interval estimation) : 100 (1-a)%

## 모평균의 점추정
* 표본평균 ![bar-x](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbar%7BX%7D)는 확률변수를 평균한 통계량으로 모평균(![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu))을 추정하기 위한 추정량
![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbar%7BX%7D%20%3D%20%5Cfrac%7B1%7D%7Bn%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%20%7BX_i%7D)

### 표본평균의 특성
1. 표본평균의 기댓값은 모평균이 됨 ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20E%28%5Cbar%7BX%7D%29%20%3D%20%5Cmu)
	* X-bar는 모평균의 불편추정량(unbiased estimator)
2. 표본평균의 분포는 표본수가 커질수록 밀집하게 됨 ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20Var%28%5Cbar%7BX%7D%29%20%3D%20%5Cfrac%7B%5Csigma%5E2%7D%7Bn%7D)
3. 중심극한정리에 따라 모집단이 어떠한 분포든지 표본크기가 충분히 크다면 표본평균은 정규분포를 따름

## 모평균의 구간추정
평균이 ![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu) 분산이 ![sigma-squared](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Csigma%5E2)인 정규분포를 따르는 모집단에서 n개 확률포본을 추출할 때, 표본평균 X-bar는 평균이 ![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu), 분산이 ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7B%5Csigma%5E2%7D%7Bn%7D)인 정규분포가 된다. 다라서 표본평균을 표준화한 통계량 ![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7B%5Cbar%7BX%7D-%5Cmu%7D%7B%5Csigma/%5Csqrt%7Bn%7D%7D)가 일정 범위에 있을 확률은 정규분포의 특성에 따라 구할 수 있다.
![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20P%281.96%20%5Cleq%20%5Cfrac%7B%5Cbar%7BX%7D-%5Cmu%7D%7B%5Csigma/%5Csqrt%7Bn%7D%7D%20%5Cleq%201.96%29%20%3D%200.95)

위 식을 X-bar를 중심으로 다시 정리할 경우, 모평균의 95% 신뢰구간은..
![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5B%5Cbar%7BX%7D-1.96%5Cfrac%7B%5Csigma%7D%7B%5Csqrt%7Bn%7D%7D%2C%20%5Cbar%7BX%7D&plus;1.96%5Cfrac%7B%5Csigma%7D%7B%5Csqrt%7Bn%7D%7D%2C%20%5D)

이를 일반화 하여 100(1-a)% 신뢰구간을 구하면… (이 때, ![z-distrbution](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20z_%7Ba/2%7D)는 표준정규분포의 오른쪽 꼬리로부터 누적확률이 a/2가 되는 점)
![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbegin%7Balign*%7D%20%26%20P%28%7C%5Cfrac%7B%5Cbar%7BX%7D-%5Cmu%7D%7B%5Csigma/%5Csqrt%7Bn%7D%7D%7C%5Cleq%20z_%7Ba/2%7D%29%20%3D%201-a%20%5C%5C%20%26%20%5B%5Cbar%7BX%7D-z_%7Ba/2%7D%5Cfrac%7B%5Csigma%7D%7B%5Csqrt%7Bn%7D%7D%2C%20%5Cbar%7BX%7D&plus;z_%7Ba/2%7D%5Cfrac%7B%5Csigma%7D%7B%5Csqrt%7Bn%7D%7D%5D%20%5Cend%7Balign*%7D)

모표준편차를 알지 못할 때, 모표준편차의 충정량인 표본표준편차 S를 대신 사용하여 모평균 ![mu](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cmu) 의 신뢰구간을 구할 수 있음
그리고 이 때, 정규분포 대신 t분포를 이용하여 신뢰구간을 구하게 됨 (여기서 ![t-distribution](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20t_%7Bn-1%2C%20a/2%7D)는 자유도가 n-1인 t분포의 오른쪽 꼬리에서부터의 누적확률이 a/2가 되는 점)
![equation](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cbegin%7Balign*%7D%20%26%20P%28%7C%5Cfrac%7B%5Cbar%7BX%7D-%5Cmu%7D%7BS/%5Csqrt%7Bn%7D%7D%7C%5Cleq%20t_%7Bn-1%2C%20a/2%7D%29%20%3D%201-a%20%5C%5C%20%26%20%5B%5Cbar%7BX%7D-t_%7Bn-1%2C%20a/2%7D%5Cfrac%7BS%7D%7B%5Csqrt%7Bn%7D%7D%2C%20%5Cbar%7BX%7D&plus;t_%7Bn-1%2C%20a/2%7D%5Cfrac%7BS%7D%7B%5Csqrt%7Bn%7D%7D%5D%20%5Cend%7Balign*%7D)
! 표본수가 적절히 클 때 t분포는 정규분포에 근접하므로 t분포 대신, 정규분포를 이용할 수 있음
