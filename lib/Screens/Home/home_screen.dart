import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intertrack/Screens/Home/JobApplicationWidgets/JobApplicationWidgets.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';
import 'package:intertrack/Shared/Shared.dart';
import 'package:intertrack/Utils/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBGColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
        child: JobApplicationsList(),
      ),
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
