import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Utils/utils.dart';

class JobDescriptionCard extends StatelessWidget {
  const JobDescriptionCard({
    Key? key,
    required NewJobApplicationController controller,
  })   : _controller = controller,
        super(key: key);
  final NewJobApplicationController _controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Responsive().extraLargeH,
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: JobType.values.length,
              itemBuilder: (context, index) {
                bool _isSelected = _controller.jobApplication.value?.jobType ==
                    JobType.values[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Responsive().tinyW),
                  child: GestureDetector(
                    child: Chip(
                      label: Text(
                        describeEnum(JobType.values[index]),
                        style:
                            TextStyle(color: _isSelected ? Colors.white : null),
                      ),
                      backgroundColor: _isSelected ? Colors.purpleAccent : null,
                    ),
                    onTap: () {
                      _controller.setJobType(JobType.values[index]);
                    },
                  ),
                );
              },
            );
          }),
        ),
        SizedBox(height: Responsive().tinyH),
        TextFormField(
          decoration: inputDecoration(labelText: 'Position'),
        ),
        SizedBox(height: Responsive().tinyH),
        TextFormField(
          decoration: inputDecoration(labelText: 'Location Remote'),
        ),
      ],
    );
  }
}
