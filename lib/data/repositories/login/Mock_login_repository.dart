import 'package:fpdart/fpdart.dart';
import '/core/type_def.dart';
import '../../../domain/entities/login/mock_login_success_model.dart';
import '/domain/repositories/login/login_base_api_service.dart';

class MockLoginRepository implements LoginBaseApiService {
  @override
  TypeDefLogin login({required Map<String, dynamic> body}) async {
    await Future.delayed(const Duration(seconds: 2));
    return right(MockLoginSuccessModel.empty().copyWith(
        token: 'newToken 123',
        firstName: "ali",
        lastName: "munawer",
        email: "a@gmail.com"));
  }
}
