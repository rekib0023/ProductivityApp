class UserModel {
  String name;
  String email;
  String authKey;
  DateTime creationDate;

  String get user_name {
    return user_name;
  }

  String get user_email {
    return email;
  }

  String get user_authKey {
    return authKey;
  }

  DateTime get user_creationDate {
    return creationDate;
  }

  set user_name(String name) {
    this.name = name;
  }

  set user_email(String email) {
    this.email = email;
  }

  set user_authKey(String authKey) {
    this.authKey = authKey;
  }

  set user_creationDate(DateTime creationDate) {
    this.creationDate = creationDate;
  }
}
