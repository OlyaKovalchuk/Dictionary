import 'package:dictionary/data/dto/user_dto.dart';
import 'package:dictionary/data/requests/sign_in_request.dart';
import 'package:dictionary/data/requests/sign_up_request.dart';

abstract interface class IAuthService {
  bool isUserLogged();

  Future<UserDTO?> signUp(SignUpRequest request);

  Future<UserDTO?> signInWithEmail(SignInRequest request);

  Future<UserDTO?> signInWithGoogle();

  Future<void> restorePassword(String password);

  Future<void> logout();
}
