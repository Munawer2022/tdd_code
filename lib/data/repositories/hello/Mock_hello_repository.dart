import 'package:fpdart/fpdart.dart';
import '/core/type_def.dart';
import '/domain/entities/hello/mock_hello_model.dart';
import '/domain/repositories/hello/hello_base_api_service.dart';

class MockHelloRepository implements HelloBaseApiService {
  @override
  TypeDefHello hello() async {
    await Future.delayed(const Duration(seconds: 2));
    return right([
      MockHelloModel.empty()
          .copyWith(address: MockAddress.empty().copyWith(city: "testing"))
    ]);
  }
}
