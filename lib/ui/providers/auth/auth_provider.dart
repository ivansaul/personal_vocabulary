import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/user.dart';
import 'package:flutter_template/domain/usecases/auth/auth_usecase.dart';
import 'package:flutter_template/domain/usecases/auth/auth_usecase_impl.dart';
import 'package:flutter_template/infrastructure/errors/auth_errors.dart';
import 'package:flutter_template/infrastructure/repositories/auth/auth_repository_impl.dart';

enum AuthStatus { checking, authenticaded, notAuthenticaded }

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authUsecase = AuthUsecaseImpl(AuthRepositoryImpl());
  return AuthNotifier(authUsecase: authUsecase);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUsecase authUsecase;
  AuthNotifier({
    required this.authUsecase,
  }) : super(AuthState());

  Future<void> registerUser(String username, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final user = await authUsecase.registerWithEmail(username, email, password);
      state = state.copyWith(user: user, authStatus: AuthStatus.authenticaded);
    } on WrongWriteUserError {
      logOut('Error al escribir en hive');
    } catch (e) {
      logOut('Error no controlado');
    }
  }

  Future<void> logOut([String? errorMessage]) async {
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticaded,
      user: null,
      errorMessage: errorMessage,
    );
  }

  Future<void> checkAutStatus() async {}
  Future<void> loginUser(String username, String email, String password) async {}
}

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
