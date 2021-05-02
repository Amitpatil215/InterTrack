import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/auth_controller.dart';

class DebugScreen extends StatelessWidget {
  final AuthController? _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _authController?.logout();
          },
          child: Text('Log Out'),
        ),
      ),
    );
  }
}
