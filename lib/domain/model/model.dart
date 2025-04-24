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
  List<Post> posts;

  HomeData(this.posts);
}
