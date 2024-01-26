import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "Application/json";

    options.baseUrl = dotenv.env["BASE_URL"] ?? "";

    if (!options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] = "Bearer ${loggedInUser?.accessToken}";
    }

    options.headers.addAll({
      "x-api-version": "v1",
    });
    super.onRequest(options, handler);
  }
}
