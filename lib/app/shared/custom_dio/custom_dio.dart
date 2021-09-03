import 'package:dio/dio.dart';

import 'authentication_interceptor_dio.dart';

const BASEURL = 'http://192.168.0.25:5001/contact-app-56152/us-central1/api';

class CustomDio {
  static CustomDio? _instance;

  CustomDio._();

  static CustomDio get instance {
    if (_instance == null) {
      _instance = CustomDio._();
    }
    return _instance!;
  }

  Dio get client => _init();

  _init() {
    BaseOptions options = new BaseOptions(
      baseUrl: BASEURL,
      connectTimeout: 35000,
      // receiveTimeout: 3000,
    );
    final dio = Dio(options);
    dio.interceptors.add(AuthenticationInterceptorDio.instance);
    return dio;
  }
}
