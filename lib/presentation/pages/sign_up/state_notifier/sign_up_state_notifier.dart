import 'package:dictionary/data/requests/sign_up_request.dart';
import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/domains/providers/auth_provider.dart';
import 'package:dictionary/presentation/pages/sign_up/state_notifier/sign_up_state.dart';
import 'package:dictionary/utils/base/base_state_notifier.dart';
import 'package:dictionary/utils/base_state.dart';

final class SignUpStateNotifier extends BaseStateNotifier {
  late final AuthProvider _authProvider;

  @override
  BaseState build() {
    _authProvider = ref.read(ProviderInjector.authProvider);

    return InitState();
  }

  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    return futureHandle(
      func: () => _authProvider.signUp(
        SignUpRequest(
          name: name,
          email: email,
          password: password,
        ),
      ),
      onComplete: (_) => SignedUpState(),
    );
  }
}
