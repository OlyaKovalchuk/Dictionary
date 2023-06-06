import 'package:dictionary/data/requests/sign_up_request.dart';
import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/domains/providers/auth_provider.dart';
import 'package:dictionary/presentation/pages/sign_up/state_notifier/sign_up_state.dart';
import 'package:dictionary/utils/base_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpStateNotifier extends Notifier<BaseState> {
  late final AuthProvider _authProvider;

  @override
  BaseState build() {
    _authProvider = ref.read(ProviderInjector.authProvider);

    return InitState();
  }

  // TODO: make abstractions for handling states and different errors.
  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    state = ProgressState();
    try {
      await _authProvider.signUp(
        SignUpRequest(
          name: name,
          email: email,
          password: password,
        ),
      );
      state = SignedUpState();
    } catch (error, _) {
      state = ErrorState(message: error.toString());
    }
  }
}
