import 'package:dictionary/data/dto/user_dto.dart';
import 'package:dictionary/data/requests/sign_up_request.dart';

abstract interface class IAuthService {
  Future<UserDTO?> signUp(SignUpRequest request);

  Future<UserDTO?> signInWithEmail(String email, String password);

  Future<UserDTO?> signInWithGoogle();

  Future<void> restorePassword(String password);

  Future<void> logout();
}
