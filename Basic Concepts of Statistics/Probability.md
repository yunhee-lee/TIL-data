# Probability
## 확률의 정의
* 확률의 고전적 정의 : 동일한 상태에서 동일한 시행을 무한 번 반복한다고 할 때 궁극적으로 전체 시행 중에서 특정 사건이 발생할 비율
* 확률적(통계적) 실험은 실험의 결과가 구체적으로 어떤 것인가 알 수 없지만 전체 가능한 모든 결과들을 알고 있고 반복이 가능한 경우를 의미 (= statistical experiment)
		* 표본공간 (sample space) : 통계적 실험의 모든 가능한 결과의 집합
		* 사건 (event) : 표본공간의 한 부분집합
* **확률의 상대도수적 정의** : 사건 A가 발생할 확룔 - 같은 조건하에서 통계적 실험을 수없이 많이 반복시행 하였을 때 사건 A가 발생하는 비율 (즉, 상대도수)
	* 표본공간의 각 원소가 발생할 가능성이 같다는 가정이 이루어질 수 없음을 전제
* 확률의 공리적 정의 : 아래 세 가지 조건을 만족할 때, P(A)를 사건 A의 확률이라고 함
	* 표본공간 S에서 임의의 사건 A에 대하여 0 ≤ P(A) ≤ 1 / P(S) = 1
	* 서로 배반인 사건 A1, A2, …에 대하여 P(A1 ∪ A2 ∪ …) = P(A1) + P(A2) + …

## 확률의 계산
### 경우의 수를 세는 효과적 방법 : 순열과 조합
* **순열 (permutation)**
	* n개의 사물 중 r개를 선택하여 순서를 고려하여 나열하는 방법의 수 = nPr
		* n! / (n-r)!
* **조합 (combination)**
	* n개의 사물 중 r개를 순서를 고려하지 않고 추출하는 방법의 수
		* nPr / r! = n! / r! (n-r)!
### 조건부 확률 (conditional probability)
* 어떤 사건이 발생했다는 조건하에서 다른 사건이 발생하는 확률 -> P(A | B) = P(A ∩ B) / P(B)
* 조건부 확률의 정의를 활용하면.. `P(A ∩ B) = P(A | B) P(B)`
	* 공통집합의 확률을 조건부 확률과 주어진 조건의 확률을 이용하여 구하는 것이 쉬울 때가 있음
### 베이즈 정리 (bayes theorem)
* 표본공간을 분할한후, 주어진 조건부 확률로부터 사건 발생확률과 새로운 조건부 확률을 구할 수 있는 정리
* [베이즈 정리 - 위키백과, 우리 모두의 백과사전](https://ko.wikipedia.org/wiki/%EB%B2%A0%EC%9D%B4%EC%A6%88_%EC%A0%95%EB%A6%AC)
### 확률의 곱셈법칙 (ref. Independent event)
* 만일 P(B | A) = P(B)이면, 사건 A와 B를 서로 독립사건 이라고 하며,
* 이 때 P(A ∩ B) = P(A)P(B)가 성립

## 확률변수 (random variable)
* 표본공간의 각 원소에 하나의 실숫값을 대응시켜 주는 함수
	* 이산형 (discrete)
	* 연속형 (continuous)
* 확률분포함수 (probability distribution function) : 확률변수 X의 값에 대한 확률을 정리해 놓은 것
	* (참고) 경우에 따라 연속형 확률분포함수는 구하기가 너무 번거롭거나 불가능한 경우도 있어, 균등분포(uniform distribution)을 가정하고 설명

## 기댓값과 분산
[7.2 기댓값과 확률변수의 변환 — 데이터 사이언스 스쿨](https://datascienceschool.net/02%20mathematics/07.02%20%EA%B8%B0%EB%8C%93%EA%B0%92%EA%B3%BC%20%ED%99%95%EB%A5%A0%EB%B3%80%EC%88%98%EC%9D%98%20%EB%B3%80%ED%99%98.html)
[7.3 분산과 표준편차 — 데이터 사이언스 스쿨](https://datascienceschool.net/02%20mathematics/07.03%20%EB%B6%84%EC%82%B0%EA%B3%BC%20%ED%91%9C%EC%A4%80%ED%8E%B8%EC%B0%A8.html)
* 표준화된 확률변수 (standardized random variable)
	* 평균이 m, 표준편차가 s인 확률변수 X가 있을 때, 변환 `Z = (X - m ) / s`를 표준화된 확률변수라고 함
		* 이 때 Z는 평균이 0, 분산이 1인 확률 변수