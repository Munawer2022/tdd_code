import 'package:fpdart/fpdart.dart';
import 'package:test123/data/datasources/login/login_data_sources.dart';

import '../../entities/login/mock_login_success_model.dart';
import '../../failure/local/existing_user_failure.dart';
import '../../repositories/local/local_storage_base_api.dart';
import '../../repositories/login/login_base_api_service.dart';

class CheckForExistingUserUseCase {
  final LoginBaseApiService _loginBaseApiService;
  final LoginDataSources _loginDataSources;
  final LocalStorageRepository _localStorageRepository;
  CheckForExistingUserUseCase(
    this._loginBaseApiService,
    this._loginDataSources,
    this._localStorageRepository,
  );

  Future<Either<ExistingUserFailure, MockLoginSuccessModel>> execute() {
    return _localStorageRepository.getUserData().then(
          (value) => value.fold(
            (l) => left(ExistingUserFailure(error: l.error)),
            (mockLoginSuccessModel) {
              if (mockLoginSuccessModel.token.isNotEmpty) {
                _loginDataSources.setLoginDataSources(mockLoginSuccessModel);
                return right(mockLoginSuccessModel);

                // return _loginBaseApiService.getUserByEmail(token).then(
                //       (value) => value.fold(
                //         (l) => left(ExistingUserFailure(error: l.error)),
                //         (user) {
                //           _loginDataSources.setLoginDataSources(user);
                //           return right(user);
                //         },
                //       ),
                //     );
              }
              return left(ExistingUserFailure(error: 'User doesn\'t exist '));
            },
          ),
        );
  }
}
