import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String id;
  final String desc;
  final bool completed;

  Todo({String? id, required this.desc, this.completed = false})
      : id = id ?? uuid.v4();
// id가 있다면 기존 id 사용 / 없다면 uuid로 새로 호출
  @override
  List<Object?> get props => [id, desc, completed];

  @override
  bool get stringify => true;
}

enum Filter {
  all,
  active,
  completed,
}
