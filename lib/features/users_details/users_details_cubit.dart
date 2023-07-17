import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_code/features/users_details/users_details_intial_params.dart';

import '../../domain/entities/users/mock_users_model.dart';

part 'users_details_state.dart';

class UsersDetailsCubit extends Cubit<UsersDetailsState> {
  UsersDetailsIntialParams usersDetailsIntialParams;
  UsersDetailsCubit(this.usersDetailsIntialParams)
      : super(UsersDetailsState.initial(
            usersDetailsIntialParams: usersDetailsIntialParams));
}
