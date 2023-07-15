import 'package:flutter_template/domain/entities/word.dart';
import 'package:flutter_template/domain/repositories/localdb_repository.dart';
import 'package:flutter_template/domain/usecases/localdb_usecase.dart';

class LocaldbUsecaseImpl extends LocaldbUsecase {
  final LocaldbRepository localdbRepository;

  LocaldbUsecaseImpl(this.localdbRepository);

  @override
  Future<void> loadData({required String name}) {
    return localdbRepository.loadData(name: name);
  }

  @override
  Future<List<Word>> getRandomWords({required int count}) {
    return localdbRepository.getRandomWords(count: count);
  }

  @override
  Future<List<Word>> searchWord({required String query}) {
    return localdbRepository.searchWord(query: query);
  }
}
