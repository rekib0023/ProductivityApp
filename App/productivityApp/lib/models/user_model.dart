class User {
  final String name;
  final String email;
  final String authKey;
  final int id;
  final String creationDate;
  final String password;

  User(
      {this.name,
      this.email,
      this.authKey,
      this.id,
      this.creationDate,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["username"],
      email: json["email"],
      authKey: json["authKey"],
      id: json["id"],
      password: json["password"],
      creationDate: json["creation_date"],
    );
  }
}
