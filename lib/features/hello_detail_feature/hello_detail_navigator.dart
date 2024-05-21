import 'package:flutter/material.dart';
import 'hello_detail_initial_params.dart';
import 'hello_detail_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

// is page say navigate kr nay ky liya 
class HelloDetailNavigator {
  HelloDetailNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

//is page pr navigate pr nay ky liya
mixin HelloDetailRoute {
openHelloDetail(HelloDetailInitialParams initialParams) {
navigator.push(
context,
HelloDetailPage(cubit: getIt(param1: initialParams))
);
}

AppNavigator get navigator;

BuildContext get context;
}
