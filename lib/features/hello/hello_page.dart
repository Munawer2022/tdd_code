import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/core/status_switcher.dart';
import 'package:test123/domain/entities/hello/mock_hello_model.dart';
import 'hello_cubit.dart';
import 'hello_state.dart';
import 'package:shimmer/shimmer.dart';

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
      body: RefreshIndicator.adaptive(
        onRefresh: cubit.refresh,
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as HelloState;
            return StatusSwitcher<List<MockHelloModel>>(
                response: state.response,
                onLoading: (context) => Shimmer.fromColors(
                    period: const Duration(milliseconds: 300),
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12)),
                          );
                        })),
                onError: (context, message) => Center(
                    child: Text(message,
                        style: Theme.of(context).textTheme.titleMedium)),
                onCompleted: (context, data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return BodyText(
                        mockHelloModel: data[index],
                        onTap: () => cubit.goHelloDetailPage(data[index]),
                      );
                    }));
          },
        ),
      ),
      //  Center(
      //   child: BlocBuilder(
      //     bloc: cubit,
      //     builder: (context, state) {
      //       state as HelloState;
      //       if (state.error != null) {
      //         return Text(state.error!);
      //       }
      //       return state.isloading
      //           ? const CircularProgressIndicator()
      //           : ListView.builder(
      //               itemCount: state.success.length,
      //               itemBuilder: (context, index) {
      //                 return BodyText(
      //                   mockHelloModel: state.success[index],
      //                   onTap: () =>
      //                       cubit.goHelloDetailPage(state.success[index]),
      //                 );
      //               });
      //     },
      //   ),
      // ),
    );
  }
}

class BodyText extends StatelessWidget {
  final MockHelloModel mockHelloModel;
  final void Function() onTap;

  const BodyText(
      {required this.mockHelloModel, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(7),
        child: InkWell(
          onTap: onTap,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(mockHelloModel.address.city,
                  style: Theme.of(context).textTheme.titleMedium)),
        ));
  }
}
