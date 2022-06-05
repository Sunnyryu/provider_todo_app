import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_ex/providers/bg_color.dart';

class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(counter: counter ?? this.counter);
  }
}

class Counter extends StateNotifier<CounterState> with LocatorMixin {
  // read, watch 기능을 사용하기 위한 것 LocatorMixin => serviceLcator라고도 함
  Counter() : super(CounterState(counter: 0));

  void increment() {
    print(read<BgColor>().state);
    // 이벤트 핸들러에서 watch를 계속 써야할 필요가 없으므로 read로 쓰기

    Color currentColor = read<BgColor>().state.color;

    if (currentColor == Colors.black) {
      state = state.copyWith(counter: state.counter + 10);
    } else if (currentColor == Colors.red) {
      state = state.copyWith(counter: state.counter - 10);
    } else {
      state = state.copyWith(counter: state.counter + 1);
    }
  }

  @override
  // LocatorMixin에서 상속받은 update 사용
  void update(Locator watch) {
    // 다른 object의 update를 listening 하게해줌 => 이건 프록시 프로바이더가 프로바이더에 대해서 하는 것과 동일
    // flutter에 대한 dependency가 업다고 한다.. flutter 외부에서도 쓸 수 있다 즉 위젯 tree 밖에서도 쓸 수 있다.
    // update 함수 내부에서는 read를 쓸 수 없다. update 함수의 argument를 이용하라 => object를 읽는 것 외에 변화를
    // watch 할 수 있게 해준다. => 편해진거 가타.
    print('in Counter StateNotifier: ${watch<BgColorState>().color}');
    print(555);
    print('in Counter StateNotifier: ${watch<BgColor>().state.color}');

    super.update(watch);
  }
}
