class AuthResponseModel {
  final dynamic user;
  final String error;

  AuthResponseModel({this.user, this.error});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: json["user"] != null ? json["user"] : "",
      error: json["error"] != null
          ? json["error"]
          : json["message"] != null
              ? json["message"]
              : "",
    );
  }
}

class AuthRequestModel {
  dynamic authKey;

  AuthRequestModel({this.authKey});

  Map<String, String> toJson() {
    Map<String, String> map = {'authKey': authKey.trim().toString()};

    return map;
  }
}
