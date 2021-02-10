class RegisterResponseModel {
  final String token;
  final String error;

  RegisterResponseModel({this.token, this.error});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null
          ? json["error"]
          : json["message"] != null
              ? json["message"]
              : "",
    );
  }
}

class RegisterRequestModel {
  String username;
  String email;
  String password;

  RegisterRequestModel({
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim().toString(),
      'email': email.trim().toString(),
      'password': password.trim().toString(),
    };

    return map;
  }
}
