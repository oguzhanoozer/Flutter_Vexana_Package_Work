import 'package:flutter/material.dart';
import 'package:vexana_work/todo/viewmodel/todo_view_model.dart';

import '../model/todo_model.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  late TodoViewModel _todoViewModel;

  @override
  void initState() {
    super.initState();
    _todoViewModel = TodoViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        floatingActionButton: _buildFloatButton(),
        body: ListView.builder(
          itemCount: _todoViewModel.todoList.length,
          itemBuilder: (context, index) {
            return _buildCardWidget(_todoViewModel.todoList[index]);
          },
        ));
  }

  FloatingActionButton _buildFloatButton() {
    return FloatingActionButton(onPressed: () async {
      await _todoViewModel.fetchToDoList();
      setState(() {});
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("ToDo List"),
    );
  }

  Card _buildCardWidget(ToDo todoModel) {
    return Card(
      child: ListTile(
        leading: Text(todoModel.userId.toString(), style: _buildBoldStyle()),
        title: Text(todoModel.title ?? "", style: _buildBoldStyle()),
        subtitle: Text(todoModel.body.toString(), maxLines: 2),
        trailing: Text(todoModel.id.toString()),
      ),
    );
  }

  TextStyle _buildBoldStyle() => TextStyle(fontWeight: FontWeight.bold);
}
