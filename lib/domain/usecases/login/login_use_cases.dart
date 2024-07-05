import 'package:fpdart/fpdart.dart';
import 'package:test123/data/datasources/login/login_data_sources_event.dart';
import '/domain/entities/local/mock_local_user_info_store_model.dart';
import '/domain/failure/login/login_failure.dart';
import '/data/datasources/login/login_data_sources.dart';
import '/domain/repositories/local/local_storage_base_api.dart';
import '/domain/repositories/login/login_base_api_service.dart';

class LoginUseCases {
  final LoginBaseApiService _loginBaseApiService;
  final LoginDataSources _loginDataSources;
  final LocalStorageRepository _localStorageRepository;
  LoginUseCases(this._loginBaseApiService, this._loginDataSources,
      this._localStorageRepository);
  Future<Either<LoginFailure, MockLocalUserInfoStoreModel>> execute(
          {required Map<String, dynamic> body}) async =>
      await _loginBaseApiService.login(body: body).then((value) => value.fold(
          (l) => left(l),
          (r) => _localStorageRepository
              .setUserData(mockLocalUserInfoStoreModel: r)
              .then((value) => value.fold(
                      (l) => left(LoginFailure(error: l.error)), (tokenRight) {
                    // _loginDataSources.setLoginDataSources(r);
                    _loginDataSources
                        .add(SetLoginDataSources(mockLoginSuccessModel: r));
                    return right(r);
                  }))));
}
