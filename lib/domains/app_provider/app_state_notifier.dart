import 'package:dictionary/domains/app_provider/app_state.dart';
import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/domains/providers/auth_provider.dart';
import 'package:dictionary/domains/providers/shared_prefs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateNotifier extends Notifier<AppState> {
  late final SharedPrefsProvider _sharedPref;
  late final AuthProvider _authProvider;

  @override
  AppState build() {
    _sharedPref = ref.read(ProviderInjector.sharedPrefsProvider);
    _authProvider = ref.read(ProviderInjector.authProvider);

    initializeApp();

    return InitState();
  }

  Future<void> initializeApp() async {
    // TODO: remove it later
    await Future.delayed(const Duration(seconds: 2));

    final isUserLogged = _authProvider.isUserLogged();
    await _sharedPref.init();

    final didTheUserFinishIntro = _sharedPref.didTheUserFinishIntro();

    state = SplashEndedState(
      isUserLogged: isUserLogged,
      didTheUserFinishIntro: didTheUserFinishIntro ?? false,
    );
  }
}
