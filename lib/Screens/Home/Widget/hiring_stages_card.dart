import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/JobApplication.dart';
import 'package:intertrack/Utils/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HiringStagesCard extends StatelessWidget {
  const HiringStagesCard({
    Key? key,
    required JobApplicationController? controller,
  })   : _controller = controller,
        super(key: key);

  final JobApplicationController? _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive().extraLargeW),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              TimelineTile(
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
              ),
              if (index == 3)
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: GestureDetector(
                    onTap: () async {
                      await _pickDate(context);
                    },
                    child: TextFormField(
                      decoration: inputDecoration(labelText: 'Phone Screening'),
                    ),
                  ),
                  trailing: GestureDetector(
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
                ),
              if (index == 3)
                Row(
                  children: [
                    Spacer(),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Add'),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
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
