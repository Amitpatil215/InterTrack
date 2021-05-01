import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intertrack/Utils/utils.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive().mediumW),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
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
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(
                      vertical: Responsive().mediumW,
                      horizontal: Responsive().extraLargeW,
                    ),
                  ),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Responsive().width * 0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Responsive().smallH,
          ),
        ],
      ),
    );
  }
}
