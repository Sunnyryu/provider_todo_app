## Todo App for Provider study

ChangeNotifierProvider + ChangeNotifierProxyProvider

ChangeNotifierProvider + ProxyProvider

StateNotifierProvider

ProxyProvider가 필요없다고요?

ChangeNotifierProvider(독립적인 States)
ChangeNotifierProxyProvider(영향을 받는 Computed States)

State는 가급적 논리적으로 분리할 수 있으면 별도로 만들어서 관리
State는 주로 클래스형으로 (논리적으로 연관된 값들을 묶어서 관리)
(Str, int, primitive type 변수도 class화 해서 관리 => 타입 충돌 피할 수 있음)

copyWith 함수 사용해 새로운 state 만듬(다른 것으로 인해 변하지 않는 state)

<<<<<<< HEAD
항상 equatable class를 포함(object instance equality check easy! )
=======
항상 equatable class를 포함(object instance equality check easy!)
>>>>>>> ede719e43a3c78221ffbd43760689743f4444cd0
stringify 등 편의 함수 제공

## study Focused