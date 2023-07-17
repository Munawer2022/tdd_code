import 'package:flutter_bloc/flutter_bloc.dart';
import 'company_details_initial_params.dart';
import 'company_details_state.dart';

class CompanyDetailsCubit extends Cubit<CompanyDetailsState> {
  final CompanyDetailsInitialParams initialParams;
  CompanyDetailsCubit(this.initialParams)
      : super(CompanyDetailsState.initial(
          companyDetailsInitialParams: initialParams,
        ));
}
