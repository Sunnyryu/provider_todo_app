import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_state/providers/active_todo_count.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TODO',
          style: TextStyle(fontSize: 40.0),
        ),
        Text(
          '${context.watch<ActiveTodoCountState>().activeTodoCount} items left',
          // state_notifier 서브클래스에서만 state를 사용할 수 있음!
          style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
        )
      ],
    );
  }
}
