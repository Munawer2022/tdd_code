import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:tdd_code/data/repositories/network_repository.dart';

import 'config/navigation/app_navigator.dart';
import 'data/repositories/users/mock_users_repository.dart';
import 'data/repositories/users/users_repository.dart';
import 'domain/repositories/users/users_base_api_services.dart';
import 'features/address_details/address_details_cubit.dart';
import 'features/address_details/address_details_initial_params.dart';
import 'features/company_details/company_details_cubit.dart';
import 'features/company_details/company_details_initial_params.dart';
import 'features/users/users_cubit.dart';
import 'features/users/users_list_initial_params.dart';
import 'features/users/users_list_navigator.dart';
import 'features/users/users_screen.dart';
import 'features/users_details/users_details_cubit.dart';
import 'features/users_details/users_details_intial_params.dart';

GetIt getIt = GetIt.instance;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true));
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<UsersBaseApiServices>(UsersRepository(getIt()));
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));
  getIt.registerFactoryParam<UsersCubit, UsersListInitailParams, dynamic>(
      (params, _) => UsersCubit(getIt(), getIt(), params)..fetchUsers());
  getIt.registerFactoryParam<UsersDetailsCubit, UsersDetailsIntialParams,
      dynamic>((params, _) => UsersDetailsCubit(params));
  getIt.registerFactoryParam<AddressDetailsCubit, AddressDetailsInitialParams,
      dynamic>((params, _) => AddressDetailsCubit(params));
  getIt.registerFactoryParam<CompanyDetailsCubit, CompanyDetailsInitialParams,
      dynamic>((params, _) => CompanyDetailsCubit(params));

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blue;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            colorSchemeSeed: color,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(color.withOpacity(0.3))))),
        theme: ThemeData(
            cardTheme: const CardTheme(elevation: 0),
            useMaterial3: true,
            colorSchemeSeed: Colors.blue,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade50)))),
        home: UsersScreen(
            usersCubit: getIt(param1: const UsersListInitailParams())));
  }
}
