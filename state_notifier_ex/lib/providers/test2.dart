import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier_ex/providers/bg_color.dart';
import 'package:state_notifier_ex/providers/counter.dart';

class TestStateTwo extends Equatable {
  final int colorType;

  TestStateTwo({required this.colorType});

  @override
  List<Object?> get props => [colorType];

  @override
  bool get stringify => true;

  TestStateTwo copyWith({
    int? colorType,
  }) {
    return TestStateTwo(colorType: colorType ?? this.colorType);
  }
}

class TestTwo extends StateNotifier<TestStateTwo> with LocatorMixin {
  TestTwo() : super(TestStateTwo(colorType: 0));

  @override
  void update(Locator watch) {
    final currentColorType = watch<BgColorState>().color;
    print("typetype");

    if (currentColorType == Colors.blue) {
      state = state.copyWith(colorType: 1);
    } else if (currentColorType == Colors.black) {
      state = state.copyWith(colorType: 2);
    } else {
      state = state.copyWith(colorType: 3);
    }
  }
}
