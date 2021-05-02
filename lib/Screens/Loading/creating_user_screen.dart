import 'package:flutter/material.dart';
import 'package:intertrack/Utils/utils.dart';

class CreatingUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hold on tight',
              style: TextStyle(
                fontSize: Responsive().largeW,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: Responsive().smallH,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Responsive().mediumW,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
