import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/domain/usecases/local/check_for_existing_user_use_case.dart';
import 'package:test123/features/hello/hello_initial_params.dart';
import 'package:test123/features/splash/splash_navigator.dart';
import '../../domain/usecases/theme/get_theme_use_case.dart';
import '../login/login_initial_params.dart';
import 'splash_initial_params.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashInitialParams initialParams;
  final SplashNavigator navigator;
  final CheckForExistingUserUseCase _checkForExistingUserUseCase;
  final GetThemeUseCase _getThemeUseCase;

  SplashCubit(this.initialParams, this.navigator,
      this._checkForExistingUserUseCase, this._getThemeUseCase)
      : super(SplashState.initial(initialParams: initialParams));

  checkUser() {
    _getThemeUseCase.execute();

    emit(state.copyWith(isloading: true));
    _checkForExistingUserUseCase.execute().then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isloading: false));
              return navigator.openLogin(const LoginInitialParams());
            },
            (r) {
              emit(state.copyWith(isloading: false));
              return navigator.openHello(HelloInitialParams());
            },
          ),
        );
  }
}
