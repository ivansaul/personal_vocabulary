import 'package:flutter_template/domain/entities/user.dart';
import 'package:flutter_template/domain/repositories/preferences_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PreferencesRepositoryImpl extends PreferencesRepository {
  late Future<Box> db;
  PreferencesRepositoryImpl() {
    db = openDB();
  }
  Future<Box> openDB() async {
    // Hive.registerAdapter(UserAdapter());
    await Hive.initFlutter();
    var box = await Hive.openBox('prefencesBox');
    return box;
  }

  @override
  Future<User> getUser({required String username}) async {
    final box = await db;
    // TODO: Fix defaul value
    final user = box.get(
      username,
      defaultValue: User(username: 'username', email: 'email', password: 'password'),
    );
    return user;
  }

  @override
  Future<void> putUser({required User user}) async {
    final box = await db;
    await box.put('user', user);
  }
}
