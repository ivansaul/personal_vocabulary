import 'package:flutter_template/domain/entities/user.dart';

abstract class PreferencesRepository {
  Future<User> getUser({required String username});
  Future<void> putUser({required User user});
}
