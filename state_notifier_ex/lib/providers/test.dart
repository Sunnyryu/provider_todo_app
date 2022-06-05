import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier_ex/providers/counter.dart';

class TestState extends Equatable {
  final String test;

  TestState({required this.test});

  @override
  List<Object?> get props => [test];

  @override
  bool get stringify => true;

  TestState copyWith({
    String? test,
  }) {
    return TestState(test: test ?? this.test);
  }
}

class Test extends StateNotifier<TestState> with LocatorMixin {
  Test() : super(TestState(test: "test"));

  void onlyPrint() {
    print("123");
  }

  @override
  void update(Locator watch) {
    final currentCounter = watch<CounterState>().counter;
    print("lovelove");

    if (currentCounter < 10 && currentCounter >= 0) {
      state = state.copyWith(test: "Low Count");
    } else if (currentCounter < 50 && currentCounter >= 10) {
      state = state.copyWith(test: "Middle Count");
    } else if (currentCounter >= 50) {
      state = state.copyWith(test: "High Count");
    } else {
      state = state.copyWith(test: "minus Count");
    }
  }
}
