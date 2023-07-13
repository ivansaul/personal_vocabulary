import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/repositories/localdb_repositorie_impl.dart';

final localdbRepositoryProvider = Provider<LocaldbRepositoryImpl>((ref) {
  return LocaldbRepositoryImpl();
});
