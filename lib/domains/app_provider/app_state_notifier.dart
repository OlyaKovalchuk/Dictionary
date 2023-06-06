import 'package:dictionary/domains/app_provider/app_state.dart';
import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/domains/providers/shared_prefs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateNotifier extends Notifier<AppState> {
  late final SharedPrefsProvider _sharedPref;

  @override
  AppState build() {
    _sharedPref = ref.read(ProviderInjector.sharedPrefsProvider);

    initializeApp();

    return InitState();
  }

  Future<void> initializeApp() async {
    // TODO: change this to check user is authorised or not
    await Future.delayed(const Duration(seconds: 3));
    await _sharedPref.init();

    final didTheUserFinishIntro = _sharedPref.didTheUserFinishIntro();

    state = SplashEndedState(
      didTheUserFinishIntro: didTheUserFinishIntro ?? false,
    );
  }
}
