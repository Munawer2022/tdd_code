class LoginEvent {}

class Login extends LoginEvent {
  Map<String, dynamic> body;
  Login({required this.body});
}
