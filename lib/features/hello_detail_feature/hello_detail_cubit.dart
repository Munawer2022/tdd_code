import 'package:flutter_bloc/flutter_bloc.dart';
import 'hello_detail_initial_params.dart';
import 'hello_detail_navigator.dart';
import 'hello_detail_state.dart';

class HelloDetailCubit extends Cubit<HelloDetailState> {
  final HelloDetailNavigator navigator;
  final HelloDetailInitialParams initialParams;
  HelloDetailCubit(this.initialParams, this.navigator)
      : super(HelloDetailState.initial(initialParams: initialParams));
}
