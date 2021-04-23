import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';
import 'package:intertrack/Utils/utils.dart';

class CompanyDateDetailsCard extends StatelessWidget {
  CompanyDateDetailsCard({
    Key? key,
    required NewJobApplicationController controller,
  })   : _controller = controller,
        super(key: key);

  final NewJobApplicationController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onFieldSubmitted: (val) {
            _controller.jobApplication.value?.companyName = val;
          },
          onChanged: (val) {
            _controller.jobApplication.value?.companyName = val;
          },
          onSaved: (val) {
            _controller.setCompanyName(val ?? '');
          },
          initialValue: _controller.jobApplication.value?.companyName,
          validator: (val) => FormValidator().isNullOrEmpty(val),
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
              _controller.pickedApplicationDate.value =
                  await _pickDate(context);
            },
            child: Obx(() {
              return Text(
                formatDate(
                  _controller.pickedApplicationDate.value ?? DateTime.now(),
                ),
              );
            }),
          ),
          trailing: GestureDetector(
            onTap: () async {
              _controller.pickedApplicationTime.value =
                  await _pickTime(context);
            },
            child: Obx(() {
              return Text(
                formatTime(timeOfDayToDateTime(
                    _controller.pickedApplicationTime.value ??
                        TimeOfDay.now())),
              );
            }),
          ),
        ),
      ],
    );
  }
}

Future<DateTime?> _pickDate(BuildContext context) async {
  final _now = DateTime.now();
  return await showDatePicker(
    context: context,
    initialDate: _now,
    firstDate: _now.subtract(Duration(days: 3000)),
    lastDate: _now.add(
      Duration(days: 3000),
    ),
  );
}

Future<TimeOfDay?> _pickTime(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
}
