import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/word.dart';
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

final randomWordsProvider = StateNotifierProvider<RandomWordsNotifier, List<Word>>((ref) {
  final localdbUsecase = ref.watch(localdbUsecaseProvider);
  return RandomWordsNotifier(localdbUsecase: localdbUsecase);
});

class RandomWordsNotifier extends StateNotifier<List<Word>> {
  final LocaldbUsecase localdbUsecase;
  RandomWordsNotifier({required this.localdbUsecase}) : super([]);

  Future<void> getRandomWords({required int count}) async {
    final words = await localdbUsecase.getRandomWords(count: count);
    state = [...words];
  }
}
