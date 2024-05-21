import '/core/type_def.dart';

abstract class LoginBaseApiService {
  TypeDefLogin login({required Map<String, dynamic> body});
}
