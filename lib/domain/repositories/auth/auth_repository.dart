import '../../entities/user.dart';

abstract class AuthRepository {
  Future<User> registerWithEmail(String username, String email, String password);
  Future<void> logout();
}
