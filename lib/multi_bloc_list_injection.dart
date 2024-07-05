import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/features/login/login_bloc.dart';

import 'features/login/login_initial_params.dart';
import 'injection_container.dart';

List<BlocProvider> multiBlocListInjection = [
  BlocProvider<LoginBloc>(
      create: (_) => getIt(param1: const LoginInitialParams())),
];
