// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class NewsModel {
  NewsModel({
    required this.category,
    required this.content,
    required this.date,
    required this.excerpt,
    required this.image,
    required this.title,
    required this.uid,
    required this.urlShare,
  });

  int category;
  String content;
  DateTime date;
  String excerpt;
  String image;
  String title;
  int uid;
  String urlShare;

  factory NewsModel.fromJson(String str) => NewsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        category: json["category"],
        content: json["content"],
        date: DateTime.parse(json["date"]),
        excerpt: json["excerpt"],
        image: json["image"],
        title: json["title"],
        uid: json["uid"],
        urlShare: json["urlShare"],
      );

  Map<String, dynamic> toMap() => {
        "category": category,
        "content": content,
        "date": date.toIso8601String(),
        "excerpt": excerpt,
        "image": image,
        "title": title,
        "uid": uid,
        "urlShare": urlShare,
      };
}
