import 'package:dreamlabs/app/extensions.dart';
import 'package:dreamlabs/data/responses/responses.dart';
import 'package:dreamlabs/domain/model/model.dart';

const empty = "";
const zero = 0;

extension HomeResponseMapper on HomeResponse? {
  HomeData toDomain() {
    List<Post> mapperPosts =
        (this?.posts.map((post) => post.toDomain()) ?? const Iterable.empty())
            .cast<Post>()
            .toList();
    return HomeData(posts: mapperPosts);
  }
}

extension PostResponseMapper on PostResponse? {
  Post toDomain() {
    return Post(
      id: this?.id?.orZero() ?? zero,
      userId: this?.userId?.orZero() ?? zero,
      body: this?.body.orEmpty() ?? empty,
      title: this?.title.orEmpty() ?? empty,
    );
  }
}
