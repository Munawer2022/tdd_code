import 'package:fpdart/fpdart.dart';

import '../../entities/hello/mock_hello_model.dart';
import '../../failure/hello/hello_failure.dart';
import '../../failure/hello/hello_use_cases_failure.dart';

class HelloUseCases {
  Future<Either<HelloFailure, MockHelloModel>> execute() => throw {};
}
