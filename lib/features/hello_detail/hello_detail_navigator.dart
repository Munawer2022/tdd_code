import 'package:flutter/material.dart';
import 'package:test123/config/navigation/transition_type.dart';
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
      context: context,
      routeName: HelloDetailPage(
        cubit: getIt(param1: initialParams),
      ),
      transitionType: TransitionType.slideFromTop,
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
