import 'dart:io';

import 'package:dio/dio.dart';

// import 'package:sentry_flutter/sentry_flutter.dart';

class ResponseValidationInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200 && (response.data['success'] ?? false)) {
      handler.next(response);
    } else {
      String? message = response.data['message'];
      Map<String, dynamic>? error = response.data['data'];
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: error,
          message: message,
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    DioException exception;
    if (err.error is SocketException) {
      exception = DioException(
          requestOptions: err.requestOptions,
          message: "It seems you have an internet connection issue");
    } else {
      exception = DioException(
        requestOptions: err.requestOptions,
        error: err.response?.data['validation'],
        message: err.response?.data['data'],
      );
    }
    super.onError(exception, handler);
  }
}
