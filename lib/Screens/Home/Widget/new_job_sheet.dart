import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Screens/Home/Widget/application_status_card.dart';
import 'package:intertrack/Screens/Home/Widget/home_screen_widgets.dart';
import 'package:intertrack/Controller/JobApplication.dart';
import 'package:intertrack/Utils/utils.dart';

class NewJobSheet extends StatelessWidget {
  final _controller = Get.put(JobApplicationController());
  final _newJobApplicationController = Get.put(NewJobApplicationController());
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
                    child: Text(
                      'Save',
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: Responsive().extraLargeW,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: "Company Name",
                  border: InputBorder.none,
                ),
              ),
              Divider(),
              SizedBox(height: Responsive().smallH),
              SubCategoryTitle(FontAwesomeIcons.clock, "Date Of Application"),
              ListTile(
                title: GestureDetector(
                  onTap: () async {
                    await pickDate(context);
                  },
                  child: Obx(() {
                    return Text(
                      formatDate(
                        _controller?.startDateTime.value ?? DateTime.now(),
                      ),
                    );
                  }),
                ),
                trailing: GestureDetector(
                  onTap: () async {
                    await pickTime(context);
                  },
                  child: Obx(() {
                    return Text(
                      formatTime(
                          _controller?.startDateTime.value ?? DateTime.now()),
                    );
                  }),
                ),
              ),
              Divider(),
              SizedBox(height: Responsive().smallH),
              SubCategoryTitle(
                  FontAwesomeIcons.graduationCap, "Job Description"),
              SizedBox(height: Responsive().tinyH),
              JobDescriptionCard(controller: _newJobApplicationController!),
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

class SubCategoryTitle extends StatelessWidget {
  const SubCategoryTitle(
    this.icondata,
    this.title,
  );

  final IconData icondata;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icondata,
          size: Responsive().largeW,
        ),
        SizedBox(
          width: Responsive().smallW,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
