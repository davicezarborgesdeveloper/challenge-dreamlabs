class HomeResponse {
  List<PostResponse?> posts;
  HomeResponse({
    required this.posts,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'posts': posts.map((x) => x?.toJson()).toList(),
    };
  }

  factory HomeResponse.fromJson(List<dynamic> json) {
    return HomeResponse(
        posts: List<PostResponse?>.from(
            json.map<PostResponse?>((x) => PostResponse.fromJson(x))));
  }
}

class PostResponse {
  int? userId;
  int? id;
  String? title;
  String? body;
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
