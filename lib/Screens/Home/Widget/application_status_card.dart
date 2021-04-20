import 'package:flutter/material.dart';
import 'package:intertrack/Utils/input_decoration.dart';

class ApplicationStatusCard extends StatelessWidget {
  const ApplicationStatusCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          value: true,
          title: Text('Application Submitted'),
          onChanged: (val) {},
        ),
        TextFormField(
          decoration: inputDecoration(labelText: 'Under Review'),
        ),
      ],
    );
  }
}
