import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intertrack/Utils/utils.dart';

class JobDescriptionCard extends StatelessWidget {
  const JobDescriptionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Responsive().extraLargeH,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: JobType.values.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: Responsive().tinyW),
                child: Chip(
                  label: Text(
                    describeEnum(JobType.values[index]),
                  ),
                ),
              );
            },
          ),
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
