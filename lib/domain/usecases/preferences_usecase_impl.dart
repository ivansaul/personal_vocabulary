import 'package:flutter_template/domain/entities/user.dart';
import 'package:flutter_template/domain/repositories/preferences_repository.dart';
import 'package:flutter_template/domain/usecases/preferences_usecase.dart';

class PreferencesUsecaseImpl extends PreferencesUsecase {
  final PreferencesRepository preferencesRepository;

  PreferencesUsecaseImpl(this.preferencesRepository);
  @override
  Future<User> getUser({required String username}) {
    return preferencesRepository.getUser(username: username);
  }

  @override
  Future<void> putUser({required User user}) {
    return preferencesRepository.putUser(user: user);
  }
}
