import 'package:bloc/bloc.dart';
import 'package:task/src/features/home/domain/usecases/get_home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getHomeUsecase) : super(HomeInitial());
  final GetHomeUsecase _getHomeUsecase;

  Future<void> get() async {
    final result = await _getHomeUsecase();
    result.fold(() => null, (a) {
      
    });
  }
}
