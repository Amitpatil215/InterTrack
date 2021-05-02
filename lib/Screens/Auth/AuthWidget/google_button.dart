import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/auth_controller.dart';
import 'package:intertrack/Utils/utils.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive().mediumW),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            final _authController = Get.put(AuthController());
            _authController?.logInGoogle();
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: Responsive().largeW,
                child: FaIcon(
                  FontAwesomeIcons.google,
                  size: Responsive().largeW,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Sign in with google'),
                ),
              )
            ],
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => navy),
            padding: MaterialStateProperty.resolveWith(
              (states) => EdgeInsets.symmetric(
                vertical: Responsive().mediumW,
                horizontal: Responsive().extraLargeW,
              ),
            ),
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Responsive().width * 0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
