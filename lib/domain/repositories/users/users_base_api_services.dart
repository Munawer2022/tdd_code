import 'package:dartz/dartz.dart';

import '../../entities/users/mock_users_model.dart';
import '../../failure/users/users_failure.dart';

abstract class UsersBaseApiServices {
  Future<Either<UsersFailure, List<MockUsersModel>>> getUsers();
}
