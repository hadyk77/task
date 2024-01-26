import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';
import 'package:task/src/features/login/presentation/cubit/token_cubit/token_cubit.dart';

class TokenValidationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (loggedInUser != null && !options.headers.containsKey("is_refresh")) {
      final isExpired = JwtDecoder.isExpired(loggedInUser!.accessToken);
      if (isExpired) {
        final refreshed = await sl<TokenCubit>().refreshToken();
        if (!refreshed) {
          return;
        }
      }
    }
    super.onRequest(options, handler);
  }
}
