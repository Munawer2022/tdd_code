import '../../domain/entities/hello/mock_hello_model.dart';
import 'hello_detail_initial_params.dart';

class HelloDetailState {
  final MockHelloModel success;

  HelloDetailState({required this.success});
  factory HelloDetailState.initial(
          {required HelloDetailInitialParams initialParams}) =>
      HelloDetailState(success: initialParams.mockHelloModel);
  HelloDetailState copyWith({MockHelloModel? success}) => HelloDetailState(
        success: success ?? this.success,
      );
}
