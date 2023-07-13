import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/usecases/localdb_usecase.dart';
import 'package:flutter_template/ui/providers/localdb_usecase_provider.dart';

final loadDataProvider = StateNotifierProvider<LoadDataNotifier, bool>((ref) {
  final localdbUsecase = ref.watch(localdbUsecaseProvider);
  return LoadDataNotifier(localdbUsecase: localdbUsecase);
});

class LoadDataNotifier extends StateNotifier<bool> {
  final LocaldbUsecase localdbUsecase;
  LoadDataNotifier({required this.localdbUsecase}) : super(false);

  Future<void> loadData() async {
    await localdbUsecase.loadData();
    state = false;
  }
}
