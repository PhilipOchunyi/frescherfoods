import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String avatarImagePath;
  @HiveField(4)
  bool agbAccepted;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.avatarImagePath,
      required this.agbAccepted});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      email: json["email"],
      password: json["password"],
      avatarImagePath: json["avatarImagePath"],
      agbAccepted: json["agbAccepted"]);
}
