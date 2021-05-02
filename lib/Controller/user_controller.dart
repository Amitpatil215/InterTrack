import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intertrack/Services/user_service.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();

  Future<void> addUser(User? user) async {
    if (user != null) {
      return await _userService.addUser(user);
    } else
      return;
  }
}
