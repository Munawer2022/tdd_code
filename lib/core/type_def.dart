import 'package:fpdart/fpdart.dart';

import '/domain/entities/hello/mock_hello_model.dart';
import '../domain/entities/local/mock_local_user_info_store_model.dart';
import '/domain/failure/hello/hello_failure.dart';
import '/domain/failure/login/login_failure.dart';

/*login*/
typedef TypeDefLogin
    = Future<Either<LoginFailure, MockLocalUserInfoStoreModel>>;
/*hello*/
typedef TypeDefHello = Future<Either<HelloFailure, List<MockHelloModel>>>;
