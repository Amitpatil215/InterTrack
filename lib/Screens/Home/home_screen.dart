import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/jobApplications_controller.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Debug/DebugWidget/DebugWidget.dart';
import 'package:intertrack/Screens/Home/JobApplicationWidgets/JobApplicationWidgets.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';
import 'package:intertrack/Shared/Shared.dart';
import 'package:intertrack/Utils/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final JobApplicationsController? _jobApplicationsController =
      Get.put(JobApplicationsController());

  final NewJobApplicationController? _newJobApplicationController =
      Get.put(NewJobApplicationController());

  @override
  void initState() {
    super.initState();

    // Starting stream for getting all the job applications of perticular user
    _jobApplicationsController?.getAllJobApplications();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBGColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
          child: Column(
            children: [
              if (kDebugMode) NavigateToDebugButton(),
              Expanded(
                child: JobApplicationsList(
                  controller: _jobApplicationsController!,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showCustomBottomModelSheet(context, NewJobSheet()).then((_) {
              _newJobApplicationController?.resetAllFieldsInSheet();
            });
          },
          label: Text('New'),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
