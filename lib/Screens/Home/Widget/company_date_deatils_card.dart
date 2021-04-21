import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/JobApplication.dart';
import 'package:intertrack/Utils/utils.dart';
import 'package:intertrack/Screens/Home/Widget/home_screen_widgets.dart';

class CompanyDateDetailsCard extends StatelessWidget {
  const CompanyDateDetailsCard({
    Key? key,
    required JobApplicationController? controller,
  })   : _controller = controller,
        super(key: key);

  final JobApplicationController? _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              await _pickDate(context);
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
              await _pickTime(context);
            },
            child: Obx(() {
              return Text(
                formatTime(_controller?.startDateTime.value ?? DateTime.now()),
              );
            }),
          ),
        ),
      ],
    );
  }
}

Future<DateTime?> _pickDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      Duration(days: 100),
    ),
  );
}

Future<TimeOfDay?> _pickTime(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
}
