import 'package:equatable/equatable.dart';

class MockLoginModel extends Equatable {
  final String username;
  final String password;

  const MockLoginModel({
    required this.username,
    required this.password,
  });

  factory MockLoginModel.empty() =>
      const MockLoginModel(username: '', password: '');

  MockLoginModel copyWith({String? username, String? password}) =>
      MockLoginModel(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [username, password];
}

// - use MockHelloModel copyWith({}) function if you have more complex api model.
// class MockHelloModel extends Equatable {
// final int id;
// final String name;

// const MockHelloModel({
//   required this.id,
//   required this.name,
// });

// const MockHelloModel.empty()
//     : id = 000,
//       name = '';

// @override
// List<Object?> get props => [
//       id,
//       name,
//     ];
// }

