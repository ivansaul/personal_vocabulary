import 'package:flutter_template/domain/entities/user.dart';
import 'package:flutter_template/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_template/domain/usecases/auth/auth_usecase.dart';

class AuthUsecaseImpl implements AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecaseImpl(this.authRepository);

  @override
  Future<User> registerWithEmail(String username, String email, String password) {
    return authRepository.registerWithEmail(username, email, password);
  }

  @override
  Future<void> logout() {
    return authRepository.logout();
  }
}
