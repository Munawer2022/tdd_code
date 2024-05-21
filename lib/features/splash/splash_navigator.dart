import 'package:flutter/material.dart';
import 'package:test123/features/login/login_navigator.dart';
import 'package:test123/features/splash/splash_page.dart';
import '/features/hello/hello_navigator.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';
import 'splash_initial_params.dart';

// is page say navigate kr nay ky liya
class SplashNavigator with HelloRoute, LoginRoute {
  SplashNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

//is page pr navigate pr nay ky liya
mixin SplashRoute {
  openLogin(SplashInitialParams initialParams) {
    navigator.push(context, SplashPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
