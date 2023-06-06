import 'package:dictionary/data/dto/user_dto.dart';
import 'package:dictionary/data/requests/sign_up_request.dart';
import 'package:dictionary/domains/repositories/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource implements IAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserDTO?> signUp(SignUpRequest request) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );
    await _firebaseAuth.currentUser?.updateDisplayName(request.name);
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      return UserDTO.fromFirebaseUser(currentUser);
    }

    return null;
  }

  @override
  Future<UserDTO?> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<UserDTO?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> restorePassword(String password) {
    // TODO: implement restorePassword
    throw UnimplementedError();
  }
}
