import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/jobApplications_controller.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';

import 'package:intertrack/Utils/utils.dart';

class NewJobSheet extends StatelessWidget {
  final _newJobApplicationController = Get.put(NewJobApplicationController());
  final _jobApplicationsController = Get.put(JobApplicationsController());
  @override
  Widget build(BuildContext context) {
    if (_jobApplicationsController!.selectedJobApplicationId.isNotEmpty) {
      print('is not empty');
      _newJobApplicationController!.initFieldsInSheet(
        _jobApplicationsController!.jobApplications.firstWhere((element) =>
            element.id ==
            _jobApplicationsController!.selectedJobApplicationId.value),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: Responsive().height * 0.95),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.multiply),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      final _application =
                          _newJobApplicationController!.onSaved();
                      if (_application != null) {
                        if (_jobApplicationsController!
                            .selectedJobApplicationId.isNotEmpty) {
                          _jobApplicationsController!
                              .editJobApplication(_application);
                          Navigator.of(context).pop();
                        } else {
                          _jobApplicationsController!
                              .appendNewJobApplication(_application);
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    child: Text(
                      'Save',
                    ),
                  )
                ],
              ),
              Form(
                key: _newJobApplicationController!.formKey.value,
                child: Column(
                  children: [
                    CompanyDateDetailsCard(
                        controller: _newJobApplicationController!),
                    Divider(),
                    SizedBox(height: Responsive().smallH),
                    SubCategoryTitle(
                        FontAwesomeIcons.graduationCap, "Job Description"),
                    SizedBox(height: Responsive().tinyH),
                    JobDescriptionCard(
                        controller: _newJobApplicationController!),
                  ],
                ),
              ),
              SizedBox(height: Responsive().smallH),
              Divider(),
              SubCategoryTitle(FontAwesomeIcons.eye, "Status"),
              ApplicationStatusCard(controller: _newJobApplicationController!),
              SizedBox(height: Responsive().smallH),
              Divider(),
              SubCategoryTitle(
                  FontAwesomeIcons.hourglassStart, "Hiring Stages"),
              HiringStagesCard(controller: _newJobApplicationController!),
              SizedBox(height: Responsive().extraLargeH)
            ],
          ),
        ),
      ),
    );
  }
}

Future<DateTime?> pickDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      Duration(days: 100),
    ),
  );
}

Future<TimeOfDay?> pickTime(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
}
