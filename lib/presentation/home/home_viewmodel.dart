import 'dart:developer';
import 'dart:ffi';

import 'package:dreamlabs/domain/model/model.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/home_usecase.dart';

enum FlowState {
  content,
  loading,
  error,
  success,
}

class HomeViewModel {
  final HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  final state = ValueNotifier(FlowState.content);
  final search = TextEditingController();

  final list = <Post>[];
  final listPost = ValueNotifier<HomeData>(HomeData(posts: <Post>[]));

  void start() {
    _getHome();
  }

  int get postCount {
    return listPost.value.posts.length;
  }

  void searchQuery(String query) {
    final searchQuery = query.toLowerCase();
    final filtered = list
        .where((p) => p.title!.toLowerCase().contains(searchQuery))
        .toList();
    listPost.value = listPost.value.copyWith(posts: filtered);
  }

  _getHome() async {
    state.value = FlowState.loading;
    await Future.delayed(const Duration(seconds: 3));
    (await _homeUseCase.execute(Void)).fold((failure) {
      state.value = FlowState.error;
      log('message ${failure.code}');
    }, (data) {
      list.addAll(data.posts);
      listPost.value.posts = list;
      state.value = FlowState.success;
    });
  }
}
