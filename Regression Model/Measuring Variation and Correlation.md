# Measuring Variation and Correlation
## How Variation Is Measured
* Variation (actually, shared variation) is at the heart of regression analysis. When two or more variables share variance, that means they are quantitatively related.
* 주어진 숫자 에 대한 변동성을 측정 하기 위해..
	* 범위(range)를 사용할 수 있지만, 이 대신 분산(variance)를 활용해 분산을 측정하면, 표본과 모집단 사이의 **정량비교**를 가능하게 함
### Sum of Deviations (편차의 합)
* (평균에 대한) 편차 전체의 합은 항상 0 -> 단순 편차의 합은 변동성의 척도로 쓸모가 없음
### Summing Squared Deviations (편차제곱의 합)
* 변동성 측정에 있어 편차의 합이 0이 되는 문제를 해결하기 위한 방법
	* 이 외에도 절대평균편차(mean absolute deviation) 활용 가능
* 엑셀에서 `DEVSQ()` 함수 활용
### Variance (분산)
* 분산 = 편차 제곱의 평균
* 분산이 평균값이기 때문에, 이 값은 **표본 크기의 효과를 상쇄**
* 엑셀에서 `VAR.P()` and/or `VAR.S()` 함수 활용
	* P and S represent population and sample
* (참고) 표본으로부터 계산된 분산은 모집단의 분산보다 작게 추산됨 / 즉, 편향(biased)된 통계량 -> 편차제곱의 합을 표본 크기 n 대신, 표본 크기에서 1을 뺀 n-1로 나누면 통계량의 편향을 제거할 수 있음

## The Standard Deviation (표준편차)
* 표준편차 = 분산의 제곱근
	* 분산은 시그마 제곱으로 표기, 표준편차를 시그마(s)로 표기
* 분산 계산 과정에서 발생하는 제곱의 측정 기준을 다시 원래 **측정 단위**로 돌려줌

## The Standard Error of the Mean
* 표준편차의 개념을 회귀 모델에서는 **추정값의 표준오차(stand error of estimate)**로 활용하여, 회귀 방정식의 정확도를 측정