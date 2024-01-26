import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';
import 'package:task/src/features/login/domain/usecases/refresh_token_usecase.dart';
import 'package:task/src/features/login/presentation/cubit/token_cubit/token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit(this._refreshTokenUsecase) : super(TokenInitial());
  final RefreshTokenUsecase _refreshTokenUsecase;
  Future<bool> refreshToken() async {
    final result = await _refreshTokenUsecase(loggedInUser!.refreshToken);
    return result.fold((l) {
      emit(TokenExpired());
      return false;
    }, (r) {
      loggedInUser = loggedInUser!.copyWith(
        accessToken: r,
      );
      return true;
    });
  }
}
