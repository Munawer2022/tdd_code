import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'hello_detail_cubit.dart';
import 'hello_detail_state.dart';

class HelloDetailPage extends StatefulWidget {
  final HelloDetailCubit cubit;

  const HelloDetailPage({
    super.key,
    required this.cubit,
  });

  @override
  State<HelloDetailPage> createState() => _HelloDetailState();
}

class _HelloDetailState extends State<HelloDetailPage> {
  HelloDetailCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as HelloDetailState;
            return ListTile(
              title: Text(state.success.address.city,
                  style: Theme.of(context).textTheme.titleMedium),
            );
          },
        ),
      ),
    );
  }
}
