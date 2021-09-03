import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../services/auth_service.dart';

class AuthenticationInterceptorDio implements InterceptorsWrapper {
  final _authService = Modular.get<AuthService>();
  static AuthenticationInterceptorDio? _instance;
  // RequestInterceptorHandler handler;

  AuthenticationInterceptorDio._();

  static AuthenticationInterceptorDio get instance {
    if (_instance == null) {
      _instance = AuthenticationInterceptorDio._();
    }
    return _instance!;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {}

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
  }

  // @override
  // Future onError(DioError err) async {
  //   return err;
  // }

  // @override
  // Future onRequest(RequestOptions options) async {
  //   final token = await _authService.getToken();
  //   options.headers['Authorization'] = 'Bearer $token';
  //   return options;
  // }

  // @override
  // Future onResponse(Response response) async {
  //   return response;
  // }
}
