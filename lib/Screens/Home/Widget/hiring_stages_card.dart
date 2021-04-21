import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Model/JobApplication.dart';
import 'package:intertrack/Utils/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

// ignore: must_be_immutable
class HiringStagesCard extends StatelessWidget {
  HiringStagesCard({
    Key? key,
    required NewJobApplicationController controller,
  })   : _controller = controller,
        super(key: key);

  final NewJobApplicationController _controller;
  final _formKey = GlobalKey<FormState>();

  _onSaved() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _controller.editThisStagebyId.value?.isEmpty ?? false
          ? _controller.addNewStage(
              Stage(
                title: _controller.selectedStageTitle.value ?? '',
                scheduledOn: _controller.pickedStageDate.value,
              ),
            )
          : _controller.editStage(
              Stage(
                id: _controller.selectedStageId.value ?? '',
                title: _controller.selectedStageTitle.value ?? '',
                scheduledOn: _controller.pickedStageDate.value,
              ),
            );
      _controller.editThisStagebyId.value = '';
      _controller.pickedStageDate.value = DateTime.now();
      _controller.selectedStageTitle.value = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive().extraLargeW),
      child: Obx(() {
        return Form(
          key: _formKey,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _controller.jobApplication.value?.stages.length,
            itemBuilder: (context, index) {
              var _sortedStagesbyDate =
                  _controller.jobApplication.value?.stages;
              _sortedStagesbyDate
                  ?.sort((a, b) => a.scheduledOn!.compareTo(b.scheduledOn!));
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
                              child: Obx(() {
                                return Text(_controller.jobApplication.value
                                        ?.stages[index].title ??
                                    '');
                              }),
                              onTap: () {
                                _controller.setEditThiStageById(_controller
                                        .jobApplication
                                        .value
                                        ?.stages[index]
                                        .id ??
                                    '');
                                _controller.setSelectedStageInfo(_controller
                                        .jobApplication
                                        .value
                                        ?.stages[index]
                                        .id ??
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
                    if ((_controller.jobApplication.value?.stages.length ==
                                index + 1 &&
                            _controller.editThisStagebyId.isEmpty) ||
                        _controller.jobApplication.value?.stages[index].id ==
                            _controller.editThisStagebyId.value) {
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: TextFormField(
                              initialValue:
                                  _controller.selectedStageTitle.value ?? '',
                              onSaved: (val) {
                                _controller.selectedStageTitle.value = val;
                              },
                              decoration:
                                  inputDecoration(labelText: 'Phone Screening'),
                            ),
                            trailing: GestureDetector(
                              onTap: () async {
                                _controller.pickedStageDate.value =
                                    await _pickDate(context);
                              },
                              child: Obx(() {
                                return Text(
                                  formatDate(
                                    _controller.pickedStageDate.value ??
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
                                onPressed: _onSaved,
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
          ),
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
