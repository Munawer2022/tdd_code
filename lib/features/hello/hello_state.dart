import '/config/response/api_response.dart';
import '/domain/entities/local/mock_local_user_info_store_model.dart';

import '/domain/entities/hello/mock_hello_model.dart';
import 'hello_initial_params.dart';

class HelloState {
  final ApiResponse<List<MockHelloModel>> response;
  final MockLocalUserInfoStoreModel? mockLoginSuccessModel;
  final bool logoutLoading;
  final bool isDarkTheme;

  HelloState(
      {required this.response,
      this.mockLoginSuccessModel,
      required this.logoutLoading,
      required this.isDarkTheme});
  factory HelloState.initial({required HelloInitialParams initialParams}) =>
      HelloState(
        response: ApiResponse.initial([]),
        mockLoginSuccessModel: MockLocalUserInfoStoreModel.empty(),
        logoutLoading: false,
        isDarkTheme: false,
      );
  HelloState copyWith({
    ApiResponse<List<MockHelloModel>>? response,
    MockLocalUserInfoStoreModel? mockLoginSuccessModel,
    bool? logoutLoading,
    bool? isDarkTheme,
  }) =>
      HelloState(
        response: response ?? this.response,
        mockLoginSuccessModel:
            mockLoginSuccessModel ?? this.mockLoginSuccessModel,
        logoutLoading: logoutLoading ?? this.logoutLoading,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      );
}
