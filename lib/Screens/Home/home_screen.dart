import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';
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
