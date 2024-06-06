import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/utils.dart';
import 'data/datasources/theme/theme_data_source.dart';
import 'features/hello/hello_page.dart';
import 'features/hello/hello_initial_params.dart';
import '/config/theme/theme_data.dart';
import 'features/login/login_initial_params.dart';
import 'features/login/login_page.dart';
import 'features/splash/splash_initial_params.dart';
import 'features/splash/splash_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  // setCustomSystemUIOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder(
            bloc: getIt<ThemeDataSources>(),
            builder: (context, state) {
              state as bool;
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: state ? darkTheme : lightTheme,
                  // home: HelloPage(cubit: getIt(param1: HelloInitialParams())));
                  // home: LoginPage(cubit: getIt(param1: const LoginInitialParams())));
                  home: SplashPage(
                      cubit: getIt(param1: const SplashInitialParams())));
            }),
      );
}
