//for complex model
//  factory HelloModel.fromJson(Map<String, dynamic> json) => HelloModel(
// id: json['id'] as int? ?? 0,
// name: json['name'] as String? ?? '',);
// class HelloModel {
//   static fromJson(e) {}
//   // final int id;
//   // final String name;

//   // HelloModel({
//   //   required this.id,
//   //   required this.name,

//   // });

//   // factory HelloModel.fromJson(Map<String, dynamic> json) => HelloModel(
//   //       id: json['id'],
//   //       name: json['name'],

//   //     );

//   // MockHelloModel toDomain() => MockHelloModel(
//   //       id: id,
//   //       name: name,

//   //     );
// }

import 'package:test123/domain/entities/login/mock_login_model.dart';

class LoginModel {
  String username;
  String password;

  LoginModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {"username": username, "password": password};

  MockLoginModel toDomain() =>
      MockLoginModel(username: username, password: password);
}
