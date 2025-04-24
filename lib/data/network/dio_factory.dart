import 'package:dio/dio.dart';

import '../../app/constant.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';

class DioFactory {
  Future<Dio> getDio() async {
    final Dio dio = Dio();
    const int timeOut = 60 * 1000;

    final Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: const Duration(milliseconds: timeOut),
      receiveTimeout: const Duration(milliseconds: timeOut),
      headers: headers,
    );

    // dio.interceptors.add(
    //   LogInterceptor(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: true,
    //   ),
    // );

    return dio;
  }
}
