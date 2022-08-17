import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User(
      {this.id,
      this.token,
      this.email,
      this.name,
      this.photoUrl,
      this.expiresIn,
      this.password});

  String? id;
  String? token;
  String? email;
  String? password;
  String? name;
  String? photoUrl;
  String? expiresIn;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["localId"],
        token: json["idToken"],
        email: json["email"],
        password: json["password"],
        name: json["displayName"],
        photoUrl: json["photoUrl"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "displayName": name,
        "photoUrl": photoUrl,
        "localId": id,
        "expiresIn": expiresIn,
        "returnSecureToken": true,
      };
}
