import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intertrack/Screens/Home/Widget/new_job_sheet.dart';
import 'package:intertrack/Shared/Shared.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomBottomModelSheet(context, NewJobSheet());
        },
        label: Text('New'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
