// active todo의 count를 표시하거나 변경할 provider

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_provider/models/todos_model.dart';
import 'package:todo_provider/providers/todo_list.dart';

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

class ActiveTodoCount with ChangeNotifier {
  // ActiveTodoCountState _state = ActiveTodoCountState.initial();
  final int initialActiveTodoCount;
  late ActiveTodoCountState _state;
  ActiveTodoCount({required this.initialActiveTodoCount}) {
    print('initialActiveTodoCOunter : $initialActiveTodoCount');
    _state = ActiveTodoCountState(activeTodoCount: initialActiveTodoCount);
  }

  ActiveTodoCountState get state => _state;

  void update(TodoList todoList) {
    // proxyprovider로 이용할 예정 , 초기값인 0은 바로 업데이트 돼연, 변화가 될떄마다 호출 / complated가 false인 것을 계산

    print(todoList.state);
    final int newActiveTodoCount = todoList.state.todos
        .where((Todo todo) => !todo.completed)
        .toList()
        .length;

    _state = _state.copyWith(activeTodoCount: newActiveTodoCount);
    print(state);
    notifyListeners();
  }
}
