import 'package:test123/domain/entities/local/mock_local_user_info_store_model.dart';

import '/domain/entities/hello/mock_hello_model.dart';
import 'hello_initial_params.dart';

class HelloState {
  final List<MockHelloModel> success;
  final bool isloading;
  final String? error;
  final MockLocalUserInfoStoreModel? mockLoginSuccessModel;
  final bool logoutloading;
  final bool isDarkTheme;

  HelloState(
      {required this.success,
      required this.isloading,
      this.error,
      this.mockLoginSuccessModel,
      required this.logoutloading,
      required this.isDarkTheme});
  factory HelloState.initial({required HelloInitialParams initialParams}) =>
      HelloState(
        success: [],
        isloading: false,
        mockLoginSuccessModel: MockLocalUserInfoStoreModel.empty(),
        logoutloading: false,
        isDarkTheme: false,
      );
  HelloState copyWith({
    List<MockHelloModel>? success,
    bool? isloading,
    String? error,
    MockLocalUserInfoStoreModel? mockLoginSuccessModel,
    bool? logoutloading,
    bool? isDarkTheme,
  }) =>
      HelloState(
        success: success ?? this.success,
        isloading: isloading ?? this.isloading,
        error: error ?? this.error,
        mockLoginSuccessModel:
            mockLoginSuccessModel ?? this.mockLoginSuccessModel,
        logoutloading: logoutloading ?? this.logoutloading,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      );
}
