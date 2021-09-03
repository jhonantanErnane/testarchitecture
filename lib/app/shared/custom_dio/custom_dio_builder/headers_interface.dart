import 'package:dio/dio.dart';
import 'parameters_interface.dart';

abstract class HeadersInterface {
  HeadersInterface addHeader(String name, dynamic value);
  ParametersInterface params();
  Future<Response> run();
}