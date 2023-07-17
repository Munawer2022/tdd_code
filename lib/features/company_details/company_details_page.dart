import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'company_details_cubit.dart';
import 'company_details_state.dart';

class CompanyDetailsPage extends StatefulWidget {
  final CompanyDetailsCubit companyDetailsCubit;

  const CompanyDetailsPage({
    Key? key,
    required this.companyDetailsCubit,
  }) : super(key: key);

  @override
  State<CompanyDetailsPage> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetailsPage> {
  CompanyDetailsCubit get companyDetailsCubit => widget.companyDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder(
            bloc: companyDetailsCubit,
            builder: (context, state) {
              state as CompanyDetailsState;
              return ListTile(
                title: Text(state.users.company.name),
                subtitle: Text(state.users.company.catchPhrase),
                trailing: Text(state.users.company.bs),
              );
            }),
      ),
    );
  }
}
