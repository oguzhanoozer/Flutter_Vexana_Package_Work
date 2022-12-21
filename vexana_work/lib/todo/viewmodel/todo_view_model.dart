import 'package:flutter/cupertino.dart';
import 'package:vexana_work/todo/service/todo_service.dart';

import '../model/todo_model.dart';

class TodoViewModel {
  final BuildContext context;
  List<ToDo> todoList = [];

  late TodoService _todoService;

  TodoViewModel(this.context) {
    _todoService = TodoService(context);
  }

  Future<void> fetchToDoList() async {
    todoList = await _todoService.fetchTodoList() ?? [];
  }
}
