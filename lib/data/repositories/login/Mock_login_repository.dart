import 'package:fpdart/fpdart.dart';
import '/core/type_def.dart';
import '../../../domain/entities/local/mock_local_user_info_store_model.dart';
import '/domain/repositories/login/login_base_api_service.dart';

class MockLoginRepository implements LoginBaseApiService {
  @override
  TypeDefLogin login({required Map<String, dynamic> body}) async {
    await Future.delayed(const Duration(seconds: 2));
    return right(
        MockLocalUserInfoStoreModel.empty().copyWith(token: 'newToken 123'));
  }
}
