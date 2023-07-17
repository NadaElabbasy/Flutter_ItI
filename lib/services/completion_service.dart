import 'package:dio/dio.dart';
import 'package:flutter_navigation/models/completion_model.dart';

class CompletionService {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<CompletionModel>> getData() async {
    List<CompletionModel> TodoList = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      CompletionModel todos = CompletionModel.fromJson(jsonElement);
      TodoList.add(todos);
    });
    return TodoList;
  }
}
