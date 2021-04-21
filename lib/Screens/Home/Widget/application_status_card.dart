import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Utils/input_decoration.dart';

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
              _controller.setApplicationStatus(val ?? false);
            },
          ),
          TextFormField(
            decoration: inputDecoration(labelText: 'Under Review'),
          ),
        ],
      );
    });
  }
}
