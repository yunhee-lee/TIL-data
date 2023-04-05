# 2022-04-05 Casual Inference
## Casual Inference : 인과 추론 소개 by Bonnie BK
source) [Causal Inference: 인과 추론 소개. 비즈니스 현장은 인과를 통해서 성과를 만드는 곳. | by Bonnie BK | BON DATA | Medium](https://medium.com/bondata/causal-inference-%EC%9D%B8%EA%B3%BC-%EC%B6%94%EB%A1%A0-%EC%86%8C%EA%B0%9C-30cc9af08cbd)
* 외생 변수를 통제하고, 원하는 조치의 영향 만을 알고자 할 때는 실험 설계 필요
* 예측 모델링과 인과 추론 모델링은 (매우) 상이 ([전문 링크](https://danbi-ncsoft.github.io/works/2019/02/07/churn_prediction_in_practice-2.html))
	* 예측 - 누가 게임에서 이탈하는지
		* 예측 모델은 예측 변수와 응답 변수 사이에 상관성을 학습하는데 상관성이 꼭 인과성을 보장하는 것은 아니기 때문에 예측 모델이 이탈을 정확히 예측한다고 해서 인과 관계를 알 수는 없으며, 
		* 설명 가능한 모델 (Explainbale AI, XAI)와 인과추론 모델은 다름
	* 인과 추론 - 왜 고객이 이탈하는지
	* 사회/경제 분야에서 통제 불가능한 요소로 인한 오차를 극복하기 위해 다양한 기법을 개발 (e.g. Instrumental Variable) -> 적절한 모델을 구성하는 것이 매우 어렵기 때문에 최근 기계 학습 분야에서 사용하는 다양한 자동화 기법을 도입하려는 움직임
* Ladder of Causality
	1. Association : 서로 연관성이 높은 현상을 찾고 -> 연관성과 추세를 바탕으로 예측 / Observational data required
	2. Intervention : 어떤 행동을 취했을 때 그 영향과 결과를 추론 / Experimental, interventional data required
	3. Counterfactuals : 시나리오 형태로 상황을 가정하여 서술 / Data not available
### Impression
* 상관관계와 인과관계, 그리고 추론과 예측이 다름은 익히 알고 있었으나, 현실 상황(특히 사업적 의사결정을 필요로 하는 여러 Initiative를 다룰 때)에서 인과관계 추론의 제약을 생각하면, 여러 다양한 패러다임을 이해하고, 또 활용할 줄 알아야 겠다는 생각
* 인과 추론과 기계 학습의 접목에 대해서는 처음 알게 되었는데, 이러한 Convergence를 이해하기 위해서도 마찬가지로 여러 가지 방법론의 의미와 활용을 이해하는 것이 중요

## Quasi-experiments : 인과 관게를 추정하는 방법 by Bonnie BK
source) [준실험 Quasi-experiments: 인과 관계를 추정하는 방법 | A/B 테스트를 할 수 없을 때 | BON DATA | Medium | BON DATA](https://medium.com/bondata/quasi-experiments-%EC%9D%B8%EA%B3%BC-%EA%B4%80%EA%B3%84-%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%98-%ED%9A%A8%EA%B3%BC-%EB%A5%BC-%EC%B8%A1%EC%A0%95%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95-da34ceefc34f)
* A/B Test를 진행할 수 없는 상황
	* Spilover Effect : 실험군에 적용한 결과가 대조군에 영향을 미칠 때
	* 비용 등 현실적 문제
	* 윤리적 문제
* Quasi-experiment : 통제 원칙을 지키지는 않았으나, 유사하게 조작을 설정할 수 있는 실험
* Difference in differences (이중차분법)
	* DID assumptions
		* OLS assupmtios
		* Parallel trend assumption
		* Stable composition of groups
		* No spillover effects
* Synthetic Control Method
	* Synthetic control은 개입이 없었을 경우의 -> counterfactual estimate을 예측하고 실제로는 존재하지 않는 control group인 것처럼 활용하는 것이 핵심
* Casual Impact
	* Google의 인과 추론 패키지로, 광고 퍼포먼스 측정과 프라이싱 실험에서 유용
	* Treatment group의 counter-factual 데이터를 가상으로 생성한다는 점에서 SCM과 유사
	* 그러나 이벤트 이전의 데이터로 이후를 예측하는 SCM과 달리 Casual Impact는 이벤트 전후 기간 전체 데이터를 바탕으로 학습하여 counter-factual을 예측함
### Apply to -
* Casual Inference에 대한 기본 개념을 어느 정도 이해하고 난 뒤에 상용 패키지와 다양한 Practices 학습 해보기!