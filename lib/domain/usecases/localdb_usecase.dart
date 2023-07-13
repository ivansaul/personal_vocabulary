import '../entities/word.dart';

abstract class LocaldbUsecase {
  Future<void> loadData();
  Future<Word> getRandomWord();
}
