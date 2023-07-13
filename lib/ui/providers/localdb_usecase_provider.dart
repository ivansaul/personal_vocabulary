import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/ui/providers/localdb_repository_provider.dart';

import '../../domain/usecases/localdb_usecase_impl.dart';

final localdbUsecaseProvider = Provider<LocaldbUsecaseImpl>((ref) {
  final localdbRepository = ref.watch(localdbRepositoryProvider);

  return LocaldbUsecaseImpl(localdbRepository);
});