
import '../../domain/entities/users/mock_users_model.dart';
import 'address_details_initial_params.dart';

class AddressDetailsState {
  final MockUsersModel mockUsersModel;

  AddressDetailsState({required this.mockUsersModel});
  factory AddressDetailsState.initial(
          {required AddressDetailsInitialParams addressDetailsInitialParams}) =>
      AddressDetailsState(
          mockUsersModel: addressDetailsInitialParams.mockUsersModel);
  AddressDetailsState copyWith({MockUsersModel? mockUsersModel}) =>
      AddressDetailsState(
        mockUsersModel: mockUsersModel ?? this.mockUsersModel,
      );
}
