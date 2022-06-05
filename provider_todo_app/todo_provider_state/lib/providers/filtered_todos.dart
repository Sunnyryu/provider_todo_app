import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_provider_state/models/todos_model.dart';
import 'package:todo_provider_state/providers/provides.dart';
import 'package:todo_provider_state/providers/todo_filter.dart';
import 'package:todo_provider_state/providers/todo_list.dart';
import 'package:todo_provider_state/providers/todo_search.dart';

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

class FilteredTodos extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodos() : super(FilteredTodosState.initial());

  // FilteredTodos({required this.initialFilteredTodos}) {
  //   print('initialFilteredTodos: $initialFilteredTodos');
  //   _state = FilteredTodosState(filterdTodos: initialFilteredTodos);
  // }

  @override
  void update(Locator watch) {
    final Filter filter = watch<TodoFilterState>().filter;
    final String searchTerm = watch<TodoSearchState>().searchTerm;
    final List<Todo> todos = watch<TodoListState>().todos;

    List<Todo> _filteredTodos;

    switch (filter) {
      case Filter.active:
        _filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todos;
        break;
    }
    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }

    state = state.copyWith(filterdTodos: _filteredTodos);
    super.update(watch);
  }
}
