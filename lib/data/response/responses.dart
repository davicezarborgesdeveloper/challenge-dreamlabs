import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostResponse {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  PostResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostResponse.fromJson(Map<String, dynamic> map) {
    return PostResponse(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }
}
