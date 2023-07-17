import 'package:dartz/dartz.dart';

import '../../../domain/entities/users/mock_users_model.dart';
import '../../../domain/failure/users/users_failure.dart';
import '../../../domain/repositories/users/users_base_api_services.dart';

class MockUsersRepository implements UsersBaseApiServices {
  @override
  Future<Either<UsersFailure, List<MockUsersModel>>> getUsers() async => right([
        MockUsersModel.empty().copyWith(
            name: 'munawer',
            username: 'ali',
            email: 'a@gmail.com',
            phone: '+923103527219',
            website: 'website.com',
            address: MockAddress.empty().copyWith(
                street: 'street',
                suite: 'suite',
                city: 'karachi',
                zipcode: '0900',
                geo: MockGeo.empty().copyWith(lat: '122', lng: '2333')),
            company: MockCompany.empty().copyWith(
                name: 'highoncyber', catchPhrase: 'catchPhrase', bs: 'bs')),
      ]);
}
