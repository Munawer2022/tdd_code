import 'package:flutter/material.dart';
import 'package:tdd_code/features/users/users_list_initial_params.dart';
import 'package:tdd_code/features/users/users_screen.dart';

import '../../../../main.dart';
import '../../config/navigation/app_navigator.dart';
import '../address_details/address_details_navigator.dart';
import '../company_details/company_details_navigator.dart';
import '../users_details/users_details_navigator.dart';

class UsersListNavigator
    with UsersDetailsRoute, AddressDetailsRoute, CompanyDetailsRoute {
  UsersListNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin UsersListRoute {
  openUsersList(UsersListInitailParams intialParams) {
    navigator.push(
        context, UsersScreen(usersCubit: getIt(param1: intialParams)));
  }

  BuildContext get context;
  AppNavigator get navigator;
}
