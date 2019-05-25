class LoginResponse {
  final String token;
  final String user;

  LoginResponse({this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(user: json['data']['user'], token: json['data']['token']);
  }
}