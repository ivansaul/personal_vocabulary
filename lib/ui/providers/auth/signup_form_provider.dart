import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/ui/providers/auth/auth_provider.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

final signUpFormProvider =
    StateNotifierProvider.autoDispose<SignUpFormNotifier, SignUpFormState>((ref) {
  final signUpUserCallback = ref.watch(authProvider.notifier).registerUser;

  return SignUpFormNotifier(signUpUserCallback: signUpUserCallback);
});

class SignUpFormNotifier extends StateNotifier<SignUpFormState> {
  final Function(String, String, String) signUpUserCallback;
  SignUpFormNotifier({
    required this.signUpUserCallback,
  }) : super(SignUpFormState());

  void onUsernamechanged(String value) {
    final username = Username.dirty(value);
    state = state.copyWith(
      username: username,
      isvalid: Formz.validate([username]),
    );
  }

  void onEmailchanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      isvalid: Formz.validate([email]),
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      isvalid: Formz.validate([password, state.email]),
    );
  }

  void onFormSubmit() {
    final username = Username.dirty(state.username.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted: true,
      username: username,
      email: email,
      password: password,
      isvalid: Formz.validate([username, email, password]),
    );

    // print(state);
    if (!state.isvalid) return;
    signUpUserCallback(
      state.username.value,
      state.email.value,
      state.password.value,
    );
  }
}

class SignUpFormState {
  final bool isFormPosted;
  final bool isPosting;
  final bool isvalid;
  final Username username;
  final Email email;
  final Password password;

  SignUpFormState({
    this.isFormPosted = false,
    this.isPosting = false,
    this.isvalid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  SignUpFormState copyWith({
    bool? isFormPosted,
    bool? isPosting,
    bool? isvalid,
    Username? username,
    Email? email,
    Password? password,
  }) {
    return SignUpFormState(
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isPosting: isPosting ?? this.isPosting,
      isvalid: isvalid ?? this.isvalid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return '''
  LoginFormState({
      isFormPosted = $isFormPosted,
      isPosting = $isPosting,
      isvalid = $isvalid,
      email = $email,
      password = $password,
    })
''';
  }
}
