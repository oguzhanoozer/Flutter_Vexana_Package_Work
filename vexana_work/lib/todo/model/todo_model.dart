import 'package:vexana/vexana.dart';

class ToDo extends INetworkModel<ToDo> {
  int? userId;
  int? id;
  String? title;
  String? body;

  ToDo({this.userId, this.id, this.title, this.body});

  ToDo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  ToDo fromJson(Map<String, dynamic> json) {
    return ToDo.fromJson(json);
  }
}
