import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/core/app_button.dart';
import '../../data/models/login/login_model.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit cubit;

  const LoginPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  LoginCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as LoginState;
            if (state.error != null) {
              return Text(
                state.error!,
                textAlign: TextAlign.center,
              );
            }

            return Column(
              children: [
                AppButton.getButton(
                    loading: state.isLoading,
                    onPressed: () => cubit.postLogin(
                        body: LoginModel(
                                username: 'emilys', password: 'emilyspass')
                            .toJson()),
                    child: const Text('Post API')),
                Text(state.success.token,
                    style: Theme.of(context).textTheme.titleMedium)
              ],
            );
          },
        ),
      ),
    );
  }
}
