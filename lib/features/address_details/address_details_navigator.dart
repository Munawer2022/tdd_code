import 'package:flutter/material.dart';
import '../../../../config/navigation/app_navigator.dart';
import '../../../../main.dart';

import 'address_details_initial_params.dart';
import 'address_details_page.dart';

class AddressDetailsNavigator {}

mixin AddressDetailsRoute {
  openAddressDetails(AddressDetailsInitialParams initialParams) {
    navigator.push(
      context,
      AddressDetailsPage(addressDetailsCubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
