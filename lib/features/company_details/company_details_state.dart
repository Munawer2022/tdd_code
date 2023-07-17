import '../../domain/entities/users/mock_users_model.dart';
import 'company_details_initial_params.dart';

class CompanyDetailsState {
  final MockUsersModel users;

  CompanyDetailsState({required this.users});
  factory CompanyDetailsState.initial({
    required CompanyDetailsInitialParams companyDetailsInitialParams,
  }) =>
      CompanyDetailsState(users: companyDetailsInitialParams.mockUsersModel);
  CompanyDetailsState copyWith({MockUsersModel? users}) => CompanyDetailsState(
        users: users ?? this.users,
      );
}
