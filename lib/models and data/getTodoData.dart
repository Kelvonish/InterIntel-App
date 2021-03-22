import 'package:interintel/models%20and%20data/todoModel.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class TodoData {
  List<TodoModel> data = [];

  Future getTodoData() async {
    try {
      var url = "https://jsonplaceholder.typicode.com/todos?_limit=5";
      var jsonresponse = await http.get(url);
      var response = convert.jsonDecode(jsonresponse.body);
      response.forEach((element) {
        TodoModel newData = TodoModel(
            userId: element['userId'],
            id: element['id'],
            title: element['title'],
            completed: element['completed']);
        data.add(newData);
      });
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
