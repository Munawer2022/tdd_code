import 'package:flutter/material.dart';
import 'package:tdd_code/features/users_details/users_details_intial_params.dart';
import 'package:tdd_code/features/users_details/users_details_screen.dart';

import '../../../../config/navigation/app_navigator.dart';
import '../../main.dart';

class UsersDetailsNavigator {}

mixin UsersDetailsRoute {
  openUsersDetails(UsersDetailsIntialParams intialParams) {
    navigator.push(context,
        UsersDetailsScreen(usersDetailsCubit: getIt(param1: intialParams)));
  }

  BuildContext get context;
  AppNavigator get navigator;
}
