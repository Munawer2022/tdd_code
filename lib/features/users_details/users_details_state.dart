part of 'users_details_cubit.dart';

class UsersDetailsState {
  final MockUsersModel mockUsersModel;
  const UsersDetailsState({required this.mockUsersModel});

  factory UsersDetailsState.initial(
          {required UsersDetailsIntialParams usersDetailsIntialParams}) =>
      UsersDetailsState(
          mockUsersModel: usersDetailsIntialParams.mockUsersModel);
  UsersDetailsState copyWith({MockUsersModel? mockUsersModel}) =>
      UsersDetailsState(
        mockUsersModel: mockUsersModel ?? this.mockUsersModel,
      );
}
