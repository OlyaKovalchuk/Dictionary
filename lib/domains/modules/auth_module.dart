import 'package:dictionary/data/converters/user_dto_converter.dart';
import 'package:dictionary/data/requests/sign_up_request.dart';
import 'package:dictionary/domains/models/user_model.dart';
import 'package:dictionary/domains/repositories/i_auth_service.dart';

class AuthModule {
  AuthModule(this._firebaseAuthService);

  final IAuthService _firebaseAuthService;

  final _userConverter = UserDTOConverter();

  Future<UserModel?> signUp(SignUpRequest request) {
    return _firebaseAuthService
        .signUp(request)
        .then(_userConverter.inToOutOrNull);
  }

  Future<UserModel?> signInWithEmail(String email, String password) =>
      _firebaseAuthService
          .signInWithEmail(email, password)
          .then(_userConverter.inToOutOrNull);

  Future<UserModel?> signInWithGoogle() => _firebaseAuthService
      .signInWithGoogle()
      .then(_userConverter.inToOutOrNull);

  Future<void> restorePassword(String password) =>
      _firebaseAuthService.restorePassword(password);

  Future<void> logout() => _firebaseAuthService.logout();
}
