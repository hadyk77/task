import 'package:dio/dio.dart';
import 'package:task/src/core/exceptions/exceptions.dart';
import 'package:task/src/core/services/networking/network_service.dart';

class DioService extends NetworkService {
  final Dio _dio;
  
  DioService(this._dio);
  @override
  Future<Response> delete(String url,
      {Map<String, String>? queryParameters}) async {
    try {
      return await _dio.delete(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw ServerException(
          error: e.message, statusCode: e.response?.statusCode);
    }
  }

  @override
  Future<Response> get(String url,
      {Map<String, String>? queryParameters}) async {
    try {
      return await _dio.get(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw ServerException(
          error: e.message, statusCode: e.response?.statusCode);
    }
  }

  @override
  Future<Response> post(
    String url, {
    Map<String, String>? queryParameters,
    Map<String, dynamic>? headers,
    data,
  }) async {
    try {
      return await _dio.post(
        url,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw ServerException(
        error: e.message,
      );
    }
  }

  @override
  Future<Response> put(String url,
      {Map<String, String>? queryParameters, data}) async {
    try {
      return await _dio.put(
        url,
        queryParameters: queryParameters,
        data: data,
      );
    } on DioException catch (e) {
      throw ServerException(error: e.message);
    }
  }
}
