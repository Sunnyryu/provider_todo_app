// active todo의 count를 표시하거나 변경할 provider

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_provider_state/models/todos_model.dart';
import 'package:todo_provider_state/providers/todo_list.dart';

// 타입에 대해 문제가 발생하지 않음!
class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;
  ActiveTodoCountState({required this.activeTodoCount});

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith({int? activeTodoCount}) {
    return ActiveTodoCountState(
        activeTodoCount: activeTodoCount ?? this.activeTodoCount);
  }
}

class ActiveTodoCount extends StateNotifier<ActiveTodoCountState>
    with LocatorMixin {
  ActiveTodoCount() : super(ActiveTodoCountState.initial());

  @override
  void update(Locator watch) {
    final List<Todo> todos = watch<TodoListState>().todos;

    state = state.copyWith(
        activeTodoCount:
            todos.where((Todo todo) => !todo.completed).toList().length);

    super.update(watch);
  }
}
