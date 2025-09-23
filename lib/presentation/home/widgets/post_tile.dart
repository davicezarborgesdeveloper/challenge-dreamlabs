import 'package:dreamlabs/data/mapper/mapper.dart';
import 'package:dreamlabs/domain/model/model.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${post.id}'),
          Text(
            post.title ?? empty,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${post.body}'),
          Text('${post.userId}'),
        ],
      ),
    );
  }
}
 // return ListTile(
                    // title: Text(
                    //   post.title ?? empty,
                    //   style: const TextStyle(fontWeight: FontWeight.bold),
                    // ),
                  //   subtitle: Text(post.body ?? empty),
                  //   onTap: () {
                  //     Navigator.of(context).push(
                  //         MaterialPageRoute(builder: (_) => DetailView(post)));
                  //   },
                  // );