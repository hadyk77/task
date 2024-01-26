import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response> get(String url, {Map<String, String>? queryParameters});
  Future<Response> post(
    String url, {
    Map<String, String>? queryParameters,
    dynamic data,
    Map<String, dynamic> headers,
  });
  Future<Response> put(String url,
      {Map<String, String>? queryParameters, dynamic data});
  Future<Response> delete(String url, {Map<String, String>? queryParameters});
}
