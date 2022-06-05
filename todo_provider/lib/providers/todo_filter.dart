import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_provider/models/todos_model.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  TodoFilterState({required this.filter});

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object?> get props => [filter];

  @override
  bool get stringify => true;

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(filter: filter ?? this.filter);
  }
}

class TodoFilter with ChangeNotifier {
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  void changeFilter(Filter newFilter) {
    _state = _state.copyWith(filter: newFilter);
    // 기존값을 mutation하지 않고 새로운 값을 만듬 = copyWith
    notifyListeners();
    // all, active, complete tag를 click할때마다 changeFilter가 작동됌
  }
}
