# Regression Model
## Regression Analysis
- - - -
* Variables
	* Independent variable (= explanatory variable)
	* Dependent variable (= response variable)
* 회귀분석은 한 개 혹은 두 개 이상의 독립변수와 종속변수 간의 함수 관계를 규명하는 통계적인 분석 방법
	* 이 때, ‘회귀’는 종속변수는 평균으로 회귀하려는 경향이 있기 때문에 붙여진 이름

## Simple Regression Model
- - - -
* Simple regression model
	* Linear in the regression coefficients
	* Linear in the independent variable
* Traits of simple regression model
	* Yi는 확률변수이며, 상수항과 오차항으로 이루어져 있음
	* 오차항의 평균은 0
	* 오차항의 분산은 등분산(homoscedastic)으로 가정
	* 오차항은 서로 독립으로 가정, 변수 간 공분산(covariance)이 성립
### Method of Least Squares
*  [The method of least squares](https://en.wikipedia.org/wiki/Least_squares)  is a standard approach in regression analysis to approximate the solution of overdetermined systems (sets of equations in which there are more equations than unknowns) by minimizing the sum of the squares of the residuals (a residual being: the difference between an observed value, and the fitted value provided by a model) made in the results of each individual equation.

## Residual
- - - -
* The  [residual](https://en.wikipedia.org/wiki/Errors_and_residuals)  is the difference between the observed value and the estimated value of the quantity of interest (for example, a sample mean).
	* (Ref.) The  [error](https://en.wikipedia.org/wiki/Errors_and_residuals)  (or disturbance) of an observation is the deviation of the observed value from the true value of a quantity of interest (for example, a population mean).
* Traits of residual
	* 잔차의 합은 0
	* 잔차제곱의 합은 최소 (최소제곱법의 정의에 의거)
	* 관찰값 Y의 합과 추정값 Y-hat의 합은 같음
	* 잔차들의 X에 의한 가중합은 0
	* 잔차들의 Y-hat에 의한 가중합은 0
	* X의 평균과 Y의 평균은 적합된 회귀선상에 위치
