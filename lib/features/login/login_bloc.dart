// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test123/features/login/login_event.dart';
// import '/domain/usecases/login/login_use_cases.dart';
// import '/features/hello/hello_initial_params.dart';
// import 'login_initial_params.dart';
// import 'login_navigator.dart';
// import 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final LoginInitialParams initialParams;
//   LoginUseCases loginUseCases;
//   final LoginNavigator navigator;

//   LoginBloc(this.initialParams, this.loginUseCases, this.navigator)
//       : super(LoginState.initial(initialParams: initialParams)) {
//     on<Login>(_postLogin);
//   }

//   void _postLogin(Login event, Emitter<LoginState> emit) async {
//     emit(state.copyWith(isLoading: true));
//     await loginUseCases.execute(body: event.body).then((value) => value
//             .fold((l) => emit(state.copyWith(error: l.error, isLoading: false)),
//                 ((r) {
//           emit(state.copyWith(success: r, isLoading: false));
//           return navigator.openHello(HelloInitialParams());
//         })));
//   }
// }
