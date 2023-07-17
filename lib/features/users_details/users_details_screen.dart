import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_code/features/users_details/users_details_cubit.dart';

class UsersDetailsScreen extends StatefulWidget {
  UsersDetailsCubit usersDetailsCubit;

  UsersDetailsScreen({super.key, required this.usersDetailsCubit});

  @override
  State<UsersDetailsScreen> createState() => _UsersDetailsScreenState();
}

class _UsersDetailsScreenState extends State<UsersDetailsScreen> {
  UsersDetailsCubit get usersDetailsCubit => widget.usersDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder(
            bloc: usersDetailsCubit,
            builder: (context, state) {
              state as UsersDetailsState;
              return ListTile(
                title: Text(state.mockUsersModel.name),
                subtitle: Text(state.mockUsersModel.email),
              );
            }),
      ),
    );
  }
}
