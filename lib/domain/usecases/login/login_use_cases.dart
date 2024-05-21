import 'package:fpdart/fpdart.dart';
import 'package:test123/data/datasources/login/login_data_sources.dart';
import 'package:test123/domain/repositories/local/local_storage_base_api.dart';
import 'package:test123/domain/repositories/login/login_base_api_service.dart';

import '../../entities/login/mock_login_success_model.dart';
import '../../failure/login/login_failure.dart';

class LoginUseCases {
  final LoginBaseApiService _loginBaseApiService;
  final LoginDataSources _loginDataSources;
  final LocalStorageRepository _localStorageRepository;
  LoginUseCases(this._loginBaseApiService, this._loginDataSources,
      this._localStorageRepository);
  Future<Either<LoginFailure, MockLoginSuccessModel>> execute(
          {required Map<String, dynamic> body}) async =>
      await _loginBaseApiService.login(body: body).then((value) => value.fold(
          (l) => left(l),
          (r) => _localStorageRepository
              .setUserData(mockLoginSuccessModel: r)
              .then((value) => value.fold(
                      (l) => left(LoginFailure(error: l.error)), (tokenRight) {
                    _loginDataSources.setLoginDataSources(r);
                    return right(r);
                  }))));
}
