class LoginResponse {
  final bool status;
  final String type;
  final String message;
  final String token;

  LoginResponse({
    this.status,
    this.type,
    this.message,
    this.token,
  });
}

class RegisterResponse {
  final bool status;
  final String type;
  final String message;

  RegisterResponse({this.status, this.type, this.message});
}
