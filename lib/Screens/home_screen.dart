import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intertrack/Shared/Shared.dart';
import 'package:intertrack/Utils/responsive_controller.dart';
import 'package:intertrack/Utils/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomBottomModelSheet(
            context,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.multiply),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Save',
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    decoration: inputDecoration(
                      labelText: "Company Name",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        label: Text('New'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
