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
    this.id,
    this.email,
    this.password,
    this.avatarImagePath,
    this.agbAccepted,
  );
}
