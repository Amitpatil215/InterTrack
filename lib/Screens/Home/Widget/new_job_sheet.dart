import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intertrack/Controller/addNewJobApplication.dart';
import 'package:intertrack/Utils/utils.dart';

class NewJobSheet extends StatelessWidget {
  final _controller = Get.put(AddNewJobApplicationController());
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
              Container(
                height: Responsive().extraLargeH,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: JobType.values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Responsive().tinyW),
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
              SizedBox(height: Responsive().smallH),
              Divider(),
              SubCategoryTitle(FontAwesomeIcons.eye, "Status"),
              CheckboxListTile(
                value: true,
                title: Text('Application Submitted'),
                onChanged: (val) {},
              ),
              TextFormField(
                decoration: inputDecoration(labelText: 'Under Review'),
              ),
              SizedBox(height: Responsive().smallH),
              Divider(),
              SubCategoryTitle(
                  FontAwesomeIcons.hourglassStart, "Hiring Stages"),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Responsive().extraLargeW),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.25,
                      beforeLineStyle: LineStyle(
                        thickness: Responsive().width * 0.004,
                        color: Colors.black,
                      ),
                      indicatorStyle: IndicatorStyle(
                          drawGap: true,
                          color: Colors.transparent,
                          iconStyle: IconStyle(
                            iconData: Icons.adjust,
                            fontSize: Responsive().extraLargeW,
                          )),
                      isFirst: index == 0,
                      startChild: SizedBox(
                        height: Responsive().smallH,
                        child: Text(
                          'Tue, 20 Apr',
                          style: TextStyle(
                            fontSize: Responsive().mediumW,
                          ),
                        ),
                      ),
                      endChild: SizedBox(
                        height: Responsive().extraLargeH,
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: Responsive().smallW,
                              ),
                              Text('Telephonic Interview'),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: GestureDetector(
                  onTap: () async {
                    await pickDate(context);
                  },
                  child: TextFormField(
                    decoration: inputDecoration(labelText: 'Phone Screening'),
                  ),
                ),
                trailing: GestureDetector(
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
              ),
              Row(
                children: [
                  Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: Responsive().extraLargeW,
                    ),
                    label: Text('Stage'),
                  ),
                ],
              ),
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
