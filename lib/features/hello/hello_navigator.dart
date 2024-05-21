import 'package:flutter/material.dart';
import 'package:test123/features/hello_detail_feature/hello_detail_navigator.dart';
import 'package:test123/features/login/login_navigator.dart';
import 'hello_initial_params.dart';
import 'hello_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

// is page say navigate kr nay ky liya
class HelloNavigator with HelloDetailRoute, LoginRoute {
  HelloNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

//is page pr navigate pr nay ky liya
mixin HelloRoute {
  openHello(HelloInitialParams initialParams) {
    navigator.push(context, HelloPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
