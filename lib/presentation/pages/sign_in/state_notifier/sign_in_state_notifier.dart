import 'package:dictionary/data/requests/sign_in_request.dart';
import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/domains/providers/auth_provider.dart';
import 'package:dictionary/presentation/pages/sign_in/state_notifier/sign_in_state.dart';
import 'package:dictionary/utils/base/base_state_notifier.dart';
import 'package:dictionary/utils/base_state.dart';

final class SignInStateNotifier extends BaseStateNotifier {
  late final AuthProvider _authProvider;

  @override
  BaseState build() {
    _authProvider = ref.read(ProviderInjector.authProvider);

    return super.build();
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) {
    return futureHandle(
      func: () => _authProvider.signInWithEmail(
        SignInRequest(
          email: email,
          password: password,
        ),
      ),
      onComplete: (_) => SignedInState(),
    );
  }

  Future<void> signInWithGoogle() {
    return futureHandle(
      func: _authProvider.signInWithGoogle,
      onComplete: (_) => SignedInState(),
    );
  }
}
