import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/addNewJobApplication.dart';
import 'package:intertrack/Utils/utils.dart';

class NewJobSheet extends StatelessWidget {
  final _controller = Get.put(AddNewJobApplicationController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.multiply),
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
              labelText: "Company Name",
              labelStyle: TextStyle(
                fontSize: Responsive().largeW,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
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
        ],
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
