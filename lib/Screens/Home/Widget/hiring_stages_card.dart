import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Utils/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HiringStagesCard extends StatelessWidget {
  const HiringStagesCard({
    Key? key,
    required NewJobApplicationController controller,
  })   : _controller = controller,
        super(key: key);

  final NewJobApplicationController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive().extraLargeW),
      child: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _controller.jobApplication.value?.stages.length,
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
                      formatDate(
                        _controller.jobApplication.value?.stages[index]
                                .scheduledOn ??
                            DateTime.now(),
                      ),
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
                          GestureDetector(
                            child: Text(_controller.jobApplication.value
                                    ?.stages[index].title ??
                                ''),
                            onTap: () {
                              _controller.setEditThiStageById(_controller
                                      .jobApplication.value?.stages[index].id ??
                                  '');
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  if (_controller.jobApplication.value?.stages[index].id ==
                      _controller.editThisStagebyId.value) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: GestureDetector(
                            onTap: () async {
                              await _pickDate(context);
                            },
                            child: TextFormField(
                              decoration:
                                  inputDecoration(labelText: 'Phone Screening'),
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: () async {
                              await _pickDate(context);
                            },
                            child: Obx(() {
                              return Text(
                                formatDate(
                                  _controller.startDateTime.value ??
                                      DateTime.now(),
                                ),
                              );
                            }),
                          ),
                        ),
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
                  } else {
                    return Container();
                  }
                }),
              ],
            );
          },
        );
      }),
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
