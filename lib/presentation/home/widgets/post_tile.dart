import 'package:dreamlabs/data/mapper/mapper.dart';
import 'package:dreamlabs/domain/model/model.dart';
import 'package:dreamlabs/presentation/detail/detail_view.dart';
import 'package:dreamlabs/presentation/resources/color_manager.dart';
import 'package:dreamlabs/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => DetailView(post))),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
            color: ColorManager.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p4, horizontal: AppPadding.p8),
              decoration: BoxDecoration(
                  color: ColorManager.primarySwatch[50],
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                'post #${post.id}',
                style: TextStyle(
                    color: ColorManager.primary, fontSize: AppSize.s12),
              ),
            ),
            const SizedBox(height: AppSize.s8),
            Text(
              post.title ?? empty,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: AppSize.s16),
            ),
            const SizedBox(height: AppSize.s16),
            Text(
              post.body ?? empty,
            ),
            const SizedBox(height: AppSize.s16),
            Text(
              'userId #${post.userId}',
              style:
                  TextStyle(color: ColorManager.primary, fontSize: AppSize.s12),
            ),
          ],
        ),
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