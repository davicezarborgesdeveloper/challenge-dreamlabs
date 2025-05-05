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

  final listPost = ValueNotifier<HomeData>(HomeData(<Post>[]));

  void start() {
    _getHome();
  }

  int get postCount {
    return listPost.value.posts.length;
  }

  _getHome() async {
    state.value = FlowState.loading;
    await Future.delayed(const Duration(seconds: 3));
    (await _homeUseCase.execute(Void)).fold((failure) {
      state.value = FlowState.error;
    }, (success) {
      listPost.value = success;
      state.value = FlowState.success;
    });
  }
}
