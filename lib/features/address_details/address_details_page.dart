import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_details_cubit.dart';
import 'address_details_state.dart';

class AddressDetailsPage extends StatefulWidget {
  final AddressDetailsCubit addressDetailsCubit;

  const AddressDetailsPage({
    Key? key,
    required this.addressDetailsCubit,
  }) : super(key: key);

  @override
  State<AddressDetailsPage> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetailsPage> {
  AddressDetailsCubit get addressDetailsCubit => widget.addressDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder(
            bloc: addressDetailsCubit,
            builder: (context, state) {
              state as AddressDetailsState;
              return ListTile(
                title: Text(state.mockUsersModel.address.city),
                subtitle: Text(state.mockUsersModel.address.street),
                trailing: Text(state.mockUsersModel.address.suite),
                leading: Text(state.mockUsersModel.address.zipcode),
              );
            }),
      ),
    );
  }
}
