import 'package:dreamlabs/domain/model/model.dart';
import 'package:dreamlabs/presentation/home/home_viewmodel.dart';
import 'package:dreamlabs/presentation/home/widgets/post_tile.dart';
import 'package:dreamlabs/presentation/resources/assets_manager.dart';
import 'package:dreamlabs/presentation/resources/color_manager.dart';
import 'package:dreamlabs/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      backgroundColor: ColorManager.primary,
      body: Column(
        children: [
          Material(
            elevation: 8,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                AppPadding.p16,
                MediaQuery.of(context).padding.top + AppPadding.p16,
                AppPadding.p16,
                AppPadding.p16,
              ),
              color: ColorManager.primarySwatch[300],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: AppMargin.m16),
                    height: 50,
                    width: 29,
                    child: SvgPicture.asset(
                      ImageAssets.logo,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _viewModel.search,
                      onChanged: _viewModel.searchQuery,
                      decoration: InputDecoration(
                        fillColor: ColorManager.white,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p12),
                        hintText: 'Buscar',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListenableBuilder(
                listenable:
                    Listenable.merge([_viewModel.state, _viewModel.listPost]),
                builder: (BuildContext context, Widget? child) {
                  if (_viewModel.state.value == FlowState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (_viewModel.state.value == FlowState.success) {
                    return ListView.separated(
                      itemCount: _viewModel.postCount,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: AppSize.s8),
                      itemBuilder: (context, index) {
                        Post post = _viewModel.listPost.value.posts[index];
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            AppPadding.p16,
                            0,
                            AppPadding.p16,
                            index == _viewModel.postCount - 1
                                ? AppPadding.p16
                                : 0,
                          ),
                          child: PostTile(post),
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
          ),
        ],
      ),
    );
  }
}
