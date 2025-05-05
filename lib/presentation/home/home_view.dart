import 'package:dreamlabs/data/mapper/mapper.dart';
import 'package:dreamlabs/domain/model/model.dart';
import 'package:dreamlabs/presentation/detail/detail_view.dart';
import 'package:dreamlabs/presentation/home/home_viewmodel.dart';
import 'package:dreamlabs/presentation/resources/assets_manager.dart';
import 'package:dreamlabs/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();
  @override
  void initState() {
    _bind();
    super.initState();
  }

  void _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.bgWhite,
        title: SizedBox(
          height: 40,
          child: Image.asset(
            ImageAssets.logoMarca,
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
      ),
      body: ListenableBuilder(
          listenable: Listenable.merge([_viewModel.state]),
          builder: (BuildContext context, Widget? child) {
            if (_viewModel.state.value == FlowState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (_viewModel.state.value == FlowState.success) {
              return ListView.separated(
                itemCount: _viewModel.postCount,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  Post post = _viewModel.listPost.value.posts[index];
                  return ListTile(
                    title: Text(
                      post.title ?? empty,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(post.body ?? empty),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DetailView(post)));
                    },
                  );
                },
              );
            }
            if (_viewModel.state.value == FlowState.error) {
              return const Center(
                child: Text('Erro desconhecido'),
              );
            }
            return Container();
          }),
    );
  }
}
