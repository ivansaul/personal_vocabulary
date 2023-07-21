import '../../entities/user.dart';

abstract class AuthUsecase {
  Future<User> registerWithEmail(String username, String email, String password);
  Future<void> logout();
}
