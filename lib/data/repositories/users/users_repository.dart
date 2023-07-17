import 'package:dartz/dartz.dart';

import '../../../config/network/network_repository.dart';
import '../../../domain/entities/users/mock_users_model.dart';
import '../../../domain/failure/users/users_failure.dart';
import '../../../domain/repositories/users/users_base_api_services.dart';
import '../../models/users/users_model.dart';

class UsersRepository implements UsersBaseApiServices {
  NetworkRepository networkRepository;
  UsersRepository(this.networkRepository);
  @override
  Future<Either<UsersFailure, List<MockUsersModel>>> getUsers() =>
      networkRepository.get('https://jsonplaceholder.typicode.com/users').then(
          (value) => value.fold((l) => left(UsersFailure(error: l.error)), (r) {
                var list = r as List;
                return right(list
                    .map((e) => UsersModel.fromJson(e).toDomain())
                    .toList());
              }));
}
