import 'package:dictionary/data/dto/user_dto.dart';
import 'package:dictionary/data/requests/sign_up_request.dart';
import 'package:dictionary/domains/repositories/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDataSource implements IAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  bool isUserLogged() => _firebaseAuth.currentUser != null;

  @override
  Future<UserDTO?> signUp(SignUpRequest request) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );
    await _firebaseAuth.currentUser?.updateDisplayName(request.name);

    return _getUser();
  }

  @override
  Future<UserDTO?> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<UserDTO?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);

    return _getUser();
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

  UserDTO? _getUser() {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      return UserDTO.fromFirebaseUser(currentUser);
    }

    return null;
  }
}
