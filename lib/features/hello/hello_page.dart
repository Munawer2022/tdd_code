import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/domain/entities/hello/mock_hello_model.dart';
import 'hello_cubit.dart';
import 'hello_state.dart';

class HelloPage extends StatefulWidget {
  final HelloCubit cubit;

  const HelloPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloState();
}

class _HelloState extends State<HelloPage> {
  HelloCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInitLoginDataSources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                state as HelloState;
                return Switch(
                    inactiveTrackColor: Colors.red,
                    value: state.isDarkTheme,
                    onChanged: cubit.onThemeChanged);
              }),
          IconButton(
              onPressed: () => cubit.logout(), icon: const Icon(Icons.logout))
        ],
        title: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as HelloState;
            return Text(state.mockLoginSuccessModel!.token);
          },
        ),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as HelloState;
            if (state.error != null) {
              return Text(state.error!);
            }
            return state.isloading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: state.success.length,
                    itemBuilder: (context, index) {
                      return BodyText(
                        mockHelloModel: state.success[index],
                        onTap: () =>
                            cubit.goHelloDetailPage(state.success[index]),
                      );
                    });
          },
        ),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  MockHelloModel mockHelloModel;
  void Function() onTap;

  BodyText({required this.mockHelloModel, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(7),
        child: InkWell(
          onTap: onTap,
          child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(mockHelloModel.address.city,
                  style: Theme.of(context).textTheme.titleMedium)),
        ));
  }
}
