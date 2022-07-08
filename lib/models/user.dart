import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));
List<User> ListUserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    required this.id,
  });

  String name;
  String email;
  String password;
  int age;
  String id;  

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"], 
        email: json["email"],
        password: json["password"],
        age: json["Age"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "Age": age,
        "id": id,
      };
}
