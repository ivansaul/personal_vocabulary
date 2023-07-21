import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/ui/providers/auth/signup_form_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widgets.dart';

class SingupScreen extends ConsumerWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(signUpFormProvider).username;
    final email = ref.watch(signUpFormProvider).email;
    final password = ref.watch(signUpFormProvider).password;
    final isFormPosted = ref.watch(signUpFormProvider).isFormPosted;

    return Scaffold(
      backgroundColor: AppTheme.primaryColorBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Text(
                    'Let’s get started',
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'The best app for learning English',
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextForm(
                    labelText: 'User Name',
                    onChanged: ref.read(signUpFormProvider.notifier).onUsernamechanged,
                    errorText: isFormPosted ? username.errorMessage : null,
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    labelText: 'Email',
                    onChanged: ref.read(signUpFormProvider.notifier).onEmailchanged,
                    errorText: isFormPosted ? email.errorMessage : null,
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    labelText: 'Password',
                    obscureText: true,
                    onChanged: ref.read(signUpFormProvider.notifier).onPasswordChanged,
                    errorText: isFormPosted ? password.errorMessage : null,
                  ),
                  const SizedBox(height: 50),
                  CustomTextIconButton(
                    text: 'Sign Up',
                    color: Colors.deepOrangeAccent,
                    onTap: () async {
                      // final user = ref.read(registerProvider);
                      // ref.read(userPutProvider(user));
                      ref.read(signUpFormProvider.notifier).onFormSubmit();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
