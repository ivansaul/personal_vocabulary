import 'package:flutter_template/domain/entities/word.dart';
import 'package:flutter_template/domain/repositories/localdb_repository.dart';
import 'package:flutter_template/domain/usecases/localdb_usecase.dart';

class LocaldbUsecaseImpl extends LocaldbUsecase {
  final LocaldbRepository localdbRepository;

  LocaldbUsecaseImpl(this.localdbRepository);

  @override
  Future<void> loadData() {
    return localdbRepository.loadData();
  }

  @override
  Future<Word> getRandomWord() {
    return localdbRepository.getRandomWord();
  }
}
