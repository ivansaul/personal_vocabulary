import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/infrastructure/repositories/preferences_repository_impl.dart';

final preferencesRepositoryProvider = Provider<PreferencesRepositoryImpl>((ref) {
  return PreferencesRepositoryImpl();
});
