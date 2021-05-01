import 'package:flutter/material.dart';
import 'package:intertrack/Screens/Auth/AuthWidget/AuthWidget.dart';
import 'package:intertrack/Utils/utils.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Responsive().width * 0.4,
            width: Responsive().width * 0.4,
            child: Image.asset(
              'assets/images/logo.png',
              color: navy,
            ),
          ),
          Spacer(),
          GoogleButton(),
          SizedBox(
            height: Responsive().smallH,
          ),
        ],
      ),
    );
  }
}
