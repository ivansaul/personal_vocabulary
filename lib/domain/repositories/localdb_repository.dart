
import '../entities/word.dart';

abstract class LocaldbRepository {
  Future<void> loadData();
  Future<Word> getRandomWord();
}