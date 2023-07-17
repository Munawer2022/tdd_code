import '../../domain/entities/users/mock_users_model.dart';

class UsersState {
  final List<MockUsersModel> users;
  final bool isloading;
  final String? error;

  UsersState({required this.users, required this.isloading, this.error});
  factory UsersState.initial() => UsersState(users: [], isloading: false);
  UsersState copyWith(
          {List<MockUsersModel>? users, bool? isloading, String? error}) =>
      UsersState(
          users: users ?? this.users,
          isloading: isloading ?? this.isloading,
          error: error ?? this.error);
}
