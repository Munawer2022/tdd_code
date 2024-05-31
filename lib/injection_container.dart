/*
************************ hello_detail ************************
*/
import 'package:test123/data/datasources/login/login_data_sources.dart';
import 'package:test123/data/repositories/network/dio_network_repository.dart';
import 'package:test123/domain/repositories/network/network_base_api_service.dart';
import 'package:test123/domain/usecases/local/check_for_existing_user_use_case.dart';

import 'data/datasources/theme/theme_data_source.dart';
import 'data/repositories/local/insecure_local_storage_repository.dart';
import 'data/repositories/network/https_network_repository.dart';
import 'domain/repositories/local/local_storage_base_api.dart';
import 'domain/usecases/login/login_use_cases.dart';
import 'domain/usecases/theme/get_theme_use_case.dart';
import 'domain/usecases/theme/update_theme_use_case.dart';
import 'features/hello_detail_feature/hello_detail_cubit.dart';
import 'features/hello_detail_feature/hello_detail_navigator.dart';
import 'features/hello_detail_feature/hello_detail_initial_params.dart';
import 'config/navigation/app_navigator.dart';

import 'package:get_it/get_it.dart';
import 'data/repositories/hello/Mock_hello_repository.dart';
import 'data/repositories/hello/hello_repository.dart';
import 'data/repositories/login/Mock_login_repository.dart';
import 'data/repositories/login/login_repository.dart';
import 'domain/repositories/hello/hello_base_api_service.dart';
import 'domain/repositories/login/login_base_api_service.dart';
import 'features/hello/hello_cubit.dart';
import 'features/hello/hello_navigator.dart';
import 'features/hello/hello_initial_params.dart';
import 'features/login/login_cubit.dart';
import 'features/login/login_initial_params.dart';
import 'features/login/login_navigator.dart';
import 'features/splash/splash_cubit.dart';
import 'features/splash/splash_initial_params.dart';
import 'features/splash/splash_navigator.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<LoginDataSources>(LoginDataSources());
  getIt.registerSingleton<NetworkBaseApiService>(
      HttpsNetworkRepository(getIt()));
  // getIt.registerSingleton<NetworkBaseApiService>(DioNetworkRepository(getIt()));
  //theme
  getIt.registerSingleton<LocalStorageRepository>(
      InsecureLocalStorageRepository());
  getIt.registerSingleton<ThemeDataSources>(ThemeDataSources());
  getIt.registerSingleton<GetThemeUseCase>(
    GetThemeUseCase(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerSingleton<UpdateThemeUseCase>(
    UpdateThemeUseCase(
      getIt(),
      getIt(),
    ),
  );

  //home
  getIt.registerSingleton<HelloBaseApiService>(HelloRepository(getIt()));
  // getIt.registerSingleton<HelloBaseApiService>(MockHelloRepository());
  getIt.registerSingleton<HelloNavigator>(HelloNavigator(getIt()));
  getIt.registerFactoryParam<HelloCubit, HelloInitialParams, dynamic>((params,
          _) =>
      HelloCubit(params, getIt(), getIt(), getIt(), getIt(), getIt(), getIt())
        ..fetchHello());

  //login
  getIt.registerSingleton<LoginBaseApiService>(LoginRepository(getIt()));
//   getIt.registerSingleton<LoginBaseApiService>(MockLoginRepository());
  getIt.registerSingleton<CheckForExistingUserUseCase>(
      CheckForExistingUserUseCase(getIt(), getIt()));
  getIt.registerSingleton<LoginUseCases>(
      LoginUseCases(getIt(), getIt(), getIt()));
  getIt.registerSingleton<LoginNavigator>(LoginNavigator(getIt()));
  getIt.registerFactoryParam<LoginCubit, LoginInitialParams, dynamic>(
      (params, _) => LoginCubit(params, getIt(), getIt()));

/*
************************ hello_detail ************************
*/
  getIt.registerSingleton<HelloDetailNavigator>(HelloDetailNavigator(getIt()));
  getIt.registerFactoryParam<HelloDetailCubit, HelloDetailInitialParams,
      dynamic>((params, _) => HelloDetailCubit(params, getIt()));

/*
************************ Splash ************************
*/
  getIt.registerSingleton<SplashNavigator>(SplashNavigator(getIt()));
  getIt.registerFactoryParam<SplashCubit, SplashInitialParams, dynamic>(
      (params, _) => SplashCubit(params, getIt(), getIt(), getIt()));
}
