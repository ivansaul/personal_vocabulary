import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/ui/providers/preferences/usecase_provider.dart';

import '../../../domain/entities/user.dart';

final userGetProvider = FutureProvider.family<User, String>((ref, username) async {
  final preferencesUsecase = ref.watch(preferencesUsecaseProvider);
  final user = await preferencesUsecase.getUser(username: username);
  return user;
});

final userPutProvider = FutureProvider.family<void, User>((ref, user) async {
  final preferencesUsecase = ref.watch(preferencesUsecaseProvider);
  await preferencesUsecase.putUser(user: user);
});

final registerProvider = StateNotifierProvider<RegisterNotifier, User>((ref) {
  return RegisterNotifier();
});

class RegisterNotifier extends StateNotifier<User> {
  RegisterNotifier() : super(User(username: '', email: '', password: ''));
  void usernameChanged(String value) {
    state = state.copyWith(username: value);
  }
  void emailChanged(String value) {
    state = state.copyWith(email: value);
  }
  void passwordChanged(String value) {
    state = state.copyWith(password: value);
  }
}
