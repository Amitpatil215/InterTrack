import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    return _firebaseFirestore.collection('users').doc(user.uid).set({
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
      'uid': user.uid,
    });
  }
}
