import 'package:dictionary/data/shared_preference/shared_prefs_contracts.dart';
import 'package:dictionary/domains/repositories/i_shared_preference_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository implements ISharedPreferenceRepository {
  late final SharedPreferences _sharedPrefs;

  @override
  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  bool? didTheUserFinishIntro() =>
      _sharedPrefs.getBool(SharedPrefsContracts.introKey);

  @override
  Future<bool> finishIntroduction() async {
    return _sharedPrefs.setBool(SharedPrefsContracts.introKey, true);
  }

  @override
  Future<bool> clear() async {
    return _sharedPrefs.remove(SharedPrefsContracts.introKey);
  }
}
