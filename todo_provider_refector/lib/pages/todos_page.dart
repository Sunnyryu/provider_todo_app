import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_refector/models/todos_model.dart';
import 'package:todo_provider_refector/providers/provides.dart';
import 'package:todo_provider_refector/todofunctions/todo_create.dart';
import 'package:todo_provider_refector/todofunctions/todo_header.dart';
import 'package:todo_provider_refector/todofunctions/todo_search_filter.dart';
import 'package:todo_provider_refector/todofunctions/todo_show.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: unnecessary_const
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                TodoHeader(),
                CreateTodo(),
                SizedBox(
                  height: 20,
                ),
                SearchAndFilterTodo(),
                SizedBox(
                  height: 5,
                ),
                ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
