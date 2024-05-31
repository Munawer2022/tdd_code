import 'package:fpdart/fpdart.dart';
import 'package:test123/domain/repositories/network/network_base_api_service.dart';

import '/core/type_def.dart';
import '../../models/local/local_user_info_store_model.dart';
import '/domain/failure/login/login_failure.dart';
import '/domain/repositories/login/login_base_api_service.dart';

class LoginRepository implements LoginBaseApiService {
  final NetworkBaseApiService _networkRepository;

  LoginRepository(this._networkRepository);

  @override
  TypeDefLogin login(
//   Future<Either<LoginFailure, MockLoginSuccessModel>> login(
          {required Map<String, dynamic> body}) =>
      _networkRepository
          .post<Map<String, dynamic>>(
              url: 'https://dummyjson.com/auth/login', body: body)
          .then((value) => value.fold((l) => left(LoginFailure(error: l.error)),
              (r) => right(LocalUserInfoStoreModel.fromJson(r).toDomain())));
}
