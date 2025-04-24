import 'package:dio/dio.dart';
import 'package:dreamlabs/data/responses/responses.dart';

import '../../app/constant.dart';

abstract class AppServiceClient {
  Future<HomeResponse> getPosts();
}

class AppServiceClientImpl implements AppServiceClient {
  AppServiceClientImpl(this._dio, {this.baseUrl}) {
    baseUrl ??= Constant.baseUrl;
  }

  final Dio _dio;

  String? baseUrl;
  @override
  Future<HomeResponse> getPosts() async {
    final Response(:data) = await _dio.get('/posts');
    return HomeResponse.fromJson(data);
  }
}
