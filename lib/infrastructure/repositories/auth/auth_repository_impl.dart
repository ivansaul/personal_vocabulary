import 'package:flutter_template/domain/entities/user.dart';
import 'package:flutter_template/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_template/infrastructure/errors/auth_errors.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  late Future<Box<User>> db;
  AuthRepositoryImpl() {
    db = openDB();
  }

  Future<Box<User>> openDB() async {
    Hive.registerAdapter(UserAdapter());
    await Hive.initFlutter();
    var box = await Hive.openBox<User>('usersBox');
    return box;
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> registerWithEmail(String username, String email, String password) async {
    try {
      final box = await db;
      final user = User(username: username, email: email, password: password);
      await box.put(username, user);
      return user;
    } catch (e) {
      throw WrongWriteUserError();
    }
  }
}
