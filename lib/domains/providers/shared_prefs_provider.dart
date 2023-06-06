import 'package:dictionary/domains/repositories/i_shared_preference_repository.dart';

class SharedPrefsProvider {
  SharedPrefsProvider(this._sharedPrefRepository);

  final ISharedPreferenceRepository _sharedPrefRepository;

  Future<void> init() => _sharedPrefRepository.init();

  Future<bool> finishIntroduction() =>
      _sharedPrefRepository.finishIntroduction();

  bool? didTheUserFinishIntro() =>
      _sharedPrefRepository.didTheUserFinishIntro();

  Future<bool> clear() => _sharedPrefRepository.clear();
}
