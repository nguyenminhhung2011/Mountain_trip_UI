import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));
List<User> ListUserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
  String id;
  String name;
  String email;
  String password;
  String avatar;
  String phoneNumber;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
      };
}
