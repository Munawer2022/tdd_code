import 'package:fpdart/fpdart.dart';
import 'package:test123/domain/repositories/network/network_base_api_service.dart';

import '/core/type_def.dart';
import '/domain/failure/hello/hello_failure.dart';
import '../../models/hello/hello_model.dart';
import '/domain/repositories/hello/hello_base_api_service.dart';

class HelloRepository implements HelloBaseApiService {
  final NetworkBaseApiService _networkRepository;

  HelloRepository(this._networkRepository);

  @override
  TypeDefHello hello() => _networkRepository
      .get<List>(url: 'https://jsonplaceholder.typicode.com/users')
      .then((value) => value.fold(
          (l) => left(HelloFailure(error: l.error)),
          (r) =>
              right(r.map((e) => HelloModel.fromJson(e).toDomain()).toList())));
}
