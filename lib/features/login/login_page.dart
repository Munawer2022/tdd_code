// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'login_cubit.dart';

// class LoginPage extends StatefulWidget {
//   final LoginCubit cubit;

//   const LoginPage({
//     Key? key,
//     required this.cubit,
//   }) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginState();
// }

// class _LoginState extends State<LoginPage> {
//   LoginCubit get cubit => widget.cubit;

//   @override
//   void initState() {
//     super.initState();
//     // TODO: Improve this
//     cubit.navigator.context = context;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: BlocBuilder(
//           bloc: cubit,
//           builder: (context, state) {
//             final userState = state as UsersListState;
//             if (userState.error != null) {
//               return Center(child: Text(userState.error!));
//             }
//             return userState.isLoading
//                 ? const CircularProgressIndicator()
//                 : ListView(
//                     children: userState.users
//                         .map(
//                           (user) => UserCard(
//                             user: user,
//                             onTap: () => cubit.onTapUser(user),
//                           ),
//                         )
//                         .toList(),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
