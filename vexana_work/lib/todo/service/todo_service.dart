import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import 'package:vexana_work/todo/model/todo_model.dart';

class TodoService {
  final BuildContext context;
  late INetworkManager _networkManager;
  TodoService(this.context) {
    _networkManager = NetworkManager<Null>(
      options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"),
    );
  }

  Future<List<ToDo>?> fetchTodoList() async {
    final _response = await _networkManager.send<ToDo, List<ToDo>>(
        networkPath.TODO.networkPathString,
        parseModel: ToDo(),
        method: RequestType.GET);
    if (_response.error != null) {
      showAboutDialog(context: context);
    }
    return _response.data;
  }
}

enum networkPath { TODO }

extension networkPathExtension on networkPath {
  String get networkPathString {
    switch (this) {
      case networkPath.TODO:
        return "/posts";
      default:
        throw "Network Path Type Not Found";
    }
  }
}
