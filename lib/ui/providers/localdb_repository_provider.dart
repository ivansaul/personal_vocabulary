import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/repositories/localdb_repository_impl.dart';

final localdbRepositoryProvider = Provider<LocaldbRepositoryImpl>((ref) {
  return LocaldbRepositoryImpl();
});
