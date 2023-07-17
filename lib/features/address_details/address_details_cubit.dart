import 'package:flutter_bloc/flutter_bloc.dart';
import 'address_details_initial_params.dart';
import 'address_details_state.dart';

class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  final AddressDetailsInitialParams initialParams;
  AddressDetailsCubit(this.initialParams)
      : super(AddressDetailsState.initial(
            addressDetailsInitialParams: initialParams));
}
