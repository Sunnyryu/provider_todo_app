import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_provider_refector/models/todos_model.dart';
import 'package:todo_provider_refector/providers/provides.dart';
import 'package:todo_provider_refector/providers/todo_filter.dart';
import 'package:todo_provider_refector/providers/todo_list.dart';
import 'package:todo_provider_refector/providers/todo_search.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filterdTodos;

  FilteredTodosState({required this.filterdTodos});

  factory FilteredTodosState.initial() {
    return FilteredTodosState(filterdTodos: []);
  }

  @override
  List<Object> get props => [filterdTodos];

  @override
  bool get stringify => true;

  FilteredTodosState copyWith({
    List<Todo>? filterdTodos,
  }) {
    return FilteredTodosState(filterdTodos: filterdTodos ?? this.filterdTodos);
  }
}

class FilteredTodos {
  final TodoFilter todoFilter;
  final TodoSearch todoSearch;
  final TodoList todoList;

  FilteredTodos(
      {required this.todoFilter,
      required this.todoSearch,
      required this.todoList});

  FilteredTodosState get state {
    // 여러분 호출됌 / 초기값 호출 / 값이 변할떄 호출
    List<Todo> _filteredTodos;

    switch (todoFilter.state.filter) {
      case Filter.active:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todoList.state.todos;
        break;
    }

    if (todoSearch.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(todoSearch.state.searchTerm))
          .toList();
    }
    return FilteredTodosState(filterdTodos: _filteredTodos);
  }
}
