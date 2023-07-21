import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/usecases/preferences_usecase_impl.dart';
import 'package:flutter_template/ui/providers/preferences/repository_provider.dart';

final preferencesUsecaseProvider = Provider<PreferencesUsecaseImpl>((ref) {
  final preferencesRepository = ref.watch(preferencesRepositoryProvider);

  return PreferencesUsecaseImpl(preferencesRepository);
});
