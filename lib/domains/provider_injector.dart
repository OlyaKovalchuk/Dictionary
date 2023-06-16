import 'package:dictionary/data/firebase/firebase_auth/firebase_auth_data_source.dart';
import 'package:dictionary/data/shared_preference/shared_preference_repository.dart';
import 'package:dictionary/domains/app_provider/app_state.dart';
import 'package:dictionary/domains/app_provider/app_state_notifier.dart';
import 'package:dictionary/domains/modules/auth_module.dart';
import 'package:dictionary/domains/providers/auth_provider.dart';
import 'package:dictionary/domains/providers/shared_prefs_provider.dart';
import 'package:dictionary/domains/repositories/i_auth_service.dart';
import 'package:dictionary/domains/repositories/i_shared_preference_repository.dart';
import 'package:dictionary/presentation/pages/sign_in/state_notifier/sign_in_state_notifier.dart';
import 'package:dictionary/presentation/pages/sign_up/state_notifier/sign_up_state_notifier.dart';
import 'package:dictionary/utils/base_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderInjector {
  ProviderInjector._();

  /// App
  static final appProvider = NotifierProvider<AppStateNotifier, AppState>(
    AppStateNotifier.new,
  );

  /// Shared Prefs
  static final sharedPrefsProvider = Provider.autoDispose<SharedPrefsProvider>(
    (ref) {
      final sharedPrefsRepo = ref.watch(_sharedPrefRepoProvider);

      return SharedPrefsProvider(sharedPrefsRepo);
    },
  );

  /// Auth
  static final signUpStateProvider =
      NotifierProvider.autoDispose<SignUpStateNotifier, BaseState>(
    SignUpStateNotifier.new,
  );
  static final signInStateProvider =
      NotifierProvider.autoDispose<SignInStateNotifier, BaseState>(
    SignInStateNotifier.new,
  );

  static final authProvider = Provider.autoDispose<AuthProvider>((ref) {
    final authModule = ref.watch(_authModuleProvider);

    return AuthProvider(authModule);
  });

  static final _authServiceProvider = Provider.autoDispose<IAuthService>(
    (ref) => FirebaseAuthDataSource(),
  );
  static final _authModuleProvider = Provider.autoDispose<AuthModule>(
    (ref) {
      final authService = ref.watch(_authServiceProvider);

      return AuthModule(authService);
    },
  );

  static final _sharedPrefRepoProvider =
      Provider.autoDispose<ISharedPreferenceRepository>(
    (ref) => SharedPreferenceRepository(),
  );
}
