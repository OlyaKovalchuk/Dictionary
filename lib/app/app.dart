import 'package:dictionary/app/app_routes.dart';
import 'package:dictionary/domains/app_provider/app_state.dart';
import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/generated/l10n.dart';
import 'package:dictionary/presentation/pages/introduction/introduction_page.dart';
import 'package:dictionary/presentation/pages/sign_up/sign_up_page.dart';
import 'package:dictionary/presentation/pages/splash/splash_page.dart';
import 'package:dictionary/res/dct_theme.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

NavigatorState? get nav => _navKey.currentState;

final _navKey = GlobalKey<NavigatorState>();

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    ref.listen(ProviderInjector.appProvider, _onStateListener);

    return ProviderScope(
      child: MaterialApp(
        navigatorKey: _navKey,
        routes: AppRoutes.routes,
        initialRoute: SplashPage.routeName,
        debugShowCheckedModeBanner: false,
        theme: dctTheme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }

  void _onStateListener(_, AppState state) {
    if (state is SplashEndedState) {
      if (state.didTheUserFinishIntro) {
        nav?.context.pushNamedAndRemoveAll(SignUpPage.routeName);
      } else {
        nav?.context.pushNamedAndRemoveAll(IntroductionPage.routeName);
      }
    }
  }
}
