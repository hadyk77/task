import 'package:dio/dio.dart';

// import 'package:sentry_flutter/sentry_flutter.dart';

class ResponseValidationInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //bool.parse(response.data['status'].toString()
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
    super.onError(
        DioException(
          requestOptions: err.requestOptions,
          error: err.response?.data['validation'],
          message: err.response?.data['data'],
        ),
        handler);
  }
}
