import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Utils/constant.dart';
import 'package:intertrack/Utils/utils.dart';

class ApplicationStatusCard extends StatelessWidget {
  const ApplicationStatusCard({
    Key? key,
    required NewJobApplicationController controller,
  })   : _controller = controller,
        super(key: key);
  final NewJobApplicationController _controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          CheckboxListTile(
            value: _controller.jobApplication.value?.isApplied,
            title: Text('Application Submitted'),
            onChanged: (val) {
              _controller.setJobApplicationStatus(val ?? false);
            },
          ),
          ListTile(
            title: Obx(() {
              return Text(
                  describeEnum(_controller.jobApplication.value!.statusLabel));
            }),
            trailing: Icon(Icons.arrow_right_outlined),
            onTap: () {
              _applicationStatusLabelPicker(context);
            },
          ),
        ],
      );
    });
  }

  Future _applicationStatusLabelPicker(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          width: Responsive().width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: ApplicationStatus.values.length,
            itemBuilder: (context, index) => Obx(() {
              return RadioListTile<ApplicationStatus>(
                title: Text(describeEnum(ApplicationStatus.values[index])),
                value: ApplicationStatus.values[index],
                groupValue: _controller.jobApplication.value?.statusLabel,
                onChanged: (val) {
                  _controller.setApplicationStatusLabel(
                      val ?? ApplicationStatus.Researching);
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
