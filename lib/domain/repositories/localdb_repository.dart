import '../entities/word.dart';

abstract class LocaldbRepository {
  Future<void> loadData();
  Future<List<Word>> getRandomWords({required int count});
  Future<List<Word>> searchWord({required String query});
}
