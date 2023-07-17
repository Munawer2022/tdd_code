import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_code/features/users/users_cubit.dart';
import 'package:tdd_code/features/users/users_state.dart';
import 'package:tdd_code/features/users/users_widget.dart';

class UsersScreen extends StatefulWidget {
  final UsersCubit usersCubit;

  const UsersScreen({super.key, required this.usersCubit});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersCubit get usersCubit => widget.usersCubit;
  @override
  void initState() {
    super.initState();

    usersCubit.usersListNavigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: usersCubit,
          builder: (context, state) {
            final userState = state as UsersState;
            if (userState.error != null) {
              return Center(child: Text(userState.error.toString()));
            }
            return userState.isloading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: userState.users
                        .map((user) => UsersWidget(
                            mockUsersModel: user,
                            ontap: () => usersCubit.onTapUsers(user),
                            ontapaddress: () =>
                                usersCubit.onTapUsersAddress(user),
                            ontapcompany: () =>
                                usersCubit.onTapUsersCompany(user)))
                        .toList());
          }),
    );
  }
}
