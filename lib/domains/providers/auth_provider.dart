import 'package:dictionary/data/requests/sign_up_request.dart';
import 'package:dictionary/domains/models/user_model.dart';
import 'package:dictionary/domains/modules/auth_module.dart';

class AuthProvider {
  AuthProvider(this._authModule);

  final AuthModule _authModule;

  Future<UserModel?> signUp(SignUpRequest request) =>
      _authModule.signUp(request);

  Future<UserModel?> signInWithEmail(String email, String password) =>
      _authModule.signInWithEmail(email, password);

  Future<UserModel?> signInWithGoogle() => _authModule.signInWithGoogle();

  Future<void> restorePassword(String password) =>
      _authModule.restorePassword(password);

  Future<void> logout() => _authModule.logout();
}
