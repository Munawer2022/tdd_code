import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/datasources/login/login_data_sources.dart';
import '/data/datasources/theme/theme_data_source.dart';
import '../../domain/usecases/theme/update_theme_use_case.dart';
import '/domain/entities/hello/mock_hello_model.dart';
import '/domain/repositories/local/local_storage_base_api.dart';
import '../hello_detail_feature/hello_detail_initial_params.dart';
import '../login/login_initial_params.dart';
import '/domain/repositories/hello/hello_base_api_service.dart';
import 'hello_initial_params.dart';
import 'hello_navigator.dart';
import 'hello_state.dart';

class HelloCubit extends Cubit<HelloState> {
  final HelloBaseApiService baseApiServices;
  final HelloNavigator navigator;
  final HelloInitialParams initialParams;
  final LoginDataSources loginDataSources;
  final LocalStorageRepository _localStorageRepository;
  final UpdateThemeUseCase _updateThemeUseCase;
  final ThemeDataSources _themeDataSources;

  HelloCubit(
      this.initialParams,
      this.baseApiServices,
      this.navigator,
      this.loginDataSources,
      this._localStorageRepository,
      this._updateThemeUseCase,
      this._themeDataSources)
      : super(HelloState.initial(initialParams: initialParams));

  Future<void> fetchHello() async {
    emit(state.copyWith(isloading: true));
    final hello = await baseApiServices.hello();
    hello.fold(
        (left) => emit(state.copyWith(error: left.error, isloading: false)),
        ((right) => emit(state.copyWith(success: right, isloading: false))));
  }

  goHelloDetailPage(MockHelloModel success) => navigator
      .openHelloDetail(HelloDetailInitialParams(mockHelloModel: success));
  onInitLoginDataSources() {
    emit(state.copyWith(
        mockLoginSuccessModel: loginDataSources.state,
        isDarkTheme: _themeDataSources.state));
    _themeDataSources.stream.listen((event) {
      emit(state.copyWith(isDarkTheme: event));
    });
  }

  logout() {
    emit(state.copyWith(logoutloading: true));
    _localStorageRepository.removeUserData().then(
          (value) => value.fold(
            (l) => emit(state.copyWith(logoutloading: false)),
            (r) {
              emit(state.copyWith(logoutloading: false));
              return navigator.openLogin(const LoginInitialParams());
            },
          ),
        );
  }

  void onThemeChanged(bool value) => _updateThemeUseCase.execute(value);
}
