import 'package:flutter/material.dart';

import '../../config/navigation/app_navigator.dart';
import '../../main.dart';
import 'company_details_initial_params.dart';
import 'company_details_page.dart';

class CompanyDetailsNavigator {}

mixin CompanyDetailsRoute {
  openCompanyDetails(CompanyDetailsInitialParams initialParams) {
    navigator.push(
      context,
      CompanyDetailsPage(
        companyDetailsCubit: getIt(param1: initialParams),
      ),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
