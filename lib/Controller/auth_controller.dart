import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intertrack/Services/auth_service.dart';

class AuthController extends GetxController {
  final _authService = AuthService();
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  Stream<User?> get currentUser => _authService.currentUser;

  Future logInGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        // Firebase sign in
        final result = await _authService.signInWithCredential(credential);
        print(result.user?.displayName);
        print(result.user?.email);
        print(result.user?.photoURL);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    _authService.logOut();
  }
}
