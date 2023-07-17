// To parse this JSON data, do
//
//     final completionModel = completionModelFromJson(jsonString);

import 'dart:convert';

List<CompletionModel> completionModelFromJson(String str) =>
    List<CompletionModel>.from(
        json.decode(str).map((x) => CompletionModel.fromJson(x)));

String completionModelToJson(List<CompletionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompletionModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  CompletionModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory CompletionModel.fromJson(Map<String, dynamic> json) =>
      CompletionModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
