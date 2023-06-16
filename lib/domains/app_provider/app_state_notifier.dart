import 'dart:async';

import 'package:dictionary/app/deeplinks/link_type.dart';
import 'package:dictionary/data/services/deep_links_handler.dart';
import 'package:dictionary/domains/app_provider/app_state.dart';
import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/domains/providers/auth_provider.dart';
import 'package:dictionary/domains/providers/shared_prefs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateNotifier extends Notifier<AppState> {
  late final SharedPrefsProvider _sharedPref;
  late final AuthProvider _authProvider;
  late final DeepLinksHandler _deeplinkHandler;
  StreamSubscription<Uri>? _linksSub;

  @override
  AppState build() {
    _sharedPref = ref.read(ProviderInjector.sharedPrefsProvider);
    _authProvider = ref.read(ProviderInjector.authProvider);
    _deeplinkHandler = ref.read(ProviderInjector.deepLinksProvider);

    initializeApp();

    return InitState();
  }

  Future<void> initializeApp() async {
    // TODO: remove it later
    await Future.delayed(const Duration(seconds: 2));
    await _deeplinkHandler.getInitialAppLink();
    final isUserLogged = _authProvider.isUserLogged();
    await _sharedPref.init();

    final didTheUserFinishIntro = _sharedPref.didTheUserFinishIntro();

    _linksSub = _deeplinkHandler.getLinksStream().listen(_deepLinkListener);

    state = SplashEndedState(
      isUserLogged: isUserLogged,
      didTheUserFinishIntro: didTheUserFinishIntro ?? false,
    );
  }

  void cancelSubs() {
    _linksSub?.cancel();
  }

  void _deepLinkListener(Uri link) {
    final action = link.queryParameters['mode'];
    final type = LinkType.values.firstWhere(
      (type) => action == type.actionName,
    );

    state = OpenPageState(type.getRouteName());
  }
}
