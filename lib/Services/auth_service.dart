import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) {
    return _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> logOut() {
    return _firebaseAuth.signOut();
  }

  Stream<User?> get currentUser => _firebaseAuth.authStateChanges();
}
