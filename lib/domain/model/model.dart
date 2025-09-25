class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
}

class HomeData {
  HomeData({
    required this.posts,
  });

  List<Post> posts;

  HomeData copyWith({
    List<Post>? posts,
  }) {
    return HomeData(
      posts: posts ?? this.posts,
    );
  }
}
