import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;

  User({
    required this.username,
    required this.email,
    required this.password,
  });

  User copyWith({
    String? username,
    String? email,
    String? password
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
