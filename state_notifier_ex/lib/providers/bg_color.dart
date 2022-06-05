import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

class BgColorState extends Equatable {
  final Color color;

  BgColorState({required this.color});

  @override
  List<Object?> get props => [color];

  @override
  bool get stringify => true;

  BgColorState copyWith({
    Color? color,
  }) {
    return BgColorState(color: color ?? this.color);
  }
}

class BgColor extends StateNotifier<BgColorState> {
  BgColor() : super(BgColorState(color: Colors.blue));
  // initial state setting은 super call에 주는 값이 초기의 state임!
  // 초기의 state 값을 외부에서 바꿔줘야한다면, bgcolor에 state를 전달하고, 그 값을 이용해
  // state setting을 함, 그리고 또 하나는 편한점은 state를 변화시키고 나서, notifylistner를 쓰지 않아도 됌
  // 이제 statenotifier를 다루는 state type이 명확해짐, 초기 state가 명확한점
  // state가 변하면 리스너에게 알려줘야 하지만...
  // state라 하는 변수의 statenotifier에 state 값이 저장된다는 것임
  // state 변수를 통해서, state를 access, setting 할 수 있음

  void changeColor() {
    if (state.color == Colors.blue) {
      state = state.copyWith(color: Colors.black);
    } else if (state.color == Colors.black) {
      state = state.copyWith(color: Colors.red);
    } else {
      state = state.copyWith(color: Colors.blue);
    }
  }
}
