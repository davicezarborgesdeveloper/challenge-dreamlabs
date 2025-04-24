import 'package:dreamlabs/data/mapper/mapper.dart';
import 'package:dreamlabs/domain/model/model.dart';
import 'package:dreamlabs/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final Post post;
  const DetailView(this.post, {super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorManager.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              widget.post.title ?? empty,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(widget.post.body ?? empty)
          ],
        ),
      ),
    );
  }
}
