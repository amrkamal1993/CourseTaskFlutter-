import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

abstract class IDioClient {
  Dio getClient();
}

class DioClient implements IDioClient {
  @override
  Dio getClient() {
    final Dio dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 60).inMilliseconds,
        sendTimeout: const Duration(seconds: 60).inMilliseconds,
        receiveTimeout: const Duration(seconds: 60).inMilliseconds,
        validateStatus: (_) => true,
        receiveDataWhenStatusError: true));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
    return dio;
  }
}
