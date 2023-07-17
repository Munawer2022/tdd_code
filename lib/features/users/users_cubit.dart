import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_code/features/users/users_list_initial_params.dart';
import 'package:tdd_code/features/users/users_list_navigator.dart';
import 'package:tdd_code/features/users/users_state.dart';

import '../../domain/entities/users/mock_users_model.dart';
import '../../domain/repositories/users/users_base_api_services.dart';
import '../address_details/address_details_initial_params.dart';
import '../company_details/company_details_initial_params.dart';
import '../users_details/users_details_intial_params.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersBaseApiServices usersBaseApiServices;
  final UsersListNavigator usersListNavigator;
  final UsersListInitailParams usersListInitailParams;
  UsersCubit(this.usersBaseApiServices, this.usersListNavigator,
      this.usersListInitailParams)
      : super(UsersState.initial());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isloading: true, error: null));
    final users = await usersBaseApiServices.getUsers();
    users.fold((l) {
      emit(state.copyWith(error: l.error));
    }, ((r) {
      emit(state.copyWith(users: r, isloading: false));
    }));
  }

  onTapUsers(MockUsersModel user) {
    usersListNavigator
        .openUsersDetails(UsersDetailsIntialParams(mockUsersModel: user));
  }

  onTapUsersAddress(MockUsersModel user) {
    usersListNavigator
        .openAddressDetails(AddressDetailsInitialParams(mockUsersModel: user));
  }

  onTapUsersCompany(MockUsersModel user) {
    usersListNavigator
        .openCompanyDetails(CompanyDetailsInitialParams(mockUsersModel: user));
  }
}
