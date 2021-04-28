import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Model/Model.dart';
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
      // all observable variables are reinitialized
      _reinitizalizeStagevariables();
    }
  }

  _reinitizalizeStagevariables() {
    _controller.editThisStagebyId.value = '';
    _controller.pickedStageDate.value = DateTime.now();
    _controller.selectedStageTitle.value = '';
    _formKey.currentState?.reset();
  }

  _onCancelled() {
    _reinitizalizeStagevariables();
  }

  _onDelete() {
    _controller.removeStageById(_controller.selectedStageId.value ?? '', true);
    _reinitizalizeStagevariables();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive().extraLargeW),
      child: Obx(() {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.jobApplication.value?.stages.length,
                itemBuilder: (context, index) {
                  var _sortedStagesbyDate =
                      _controller.jobApplication.value?.stages;
                  _sortedStagesbyDate?.sort(
                      (a, b) => a.scheduledOn!.compareTo(b.scheduledOn!));
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
                            formatDateEEDDMMM(
                              _controller.jobApplication.value?.stages[index]
                                      .scheduledOn ??
                                  DateTime.now(),
                            ),
                            style: TextStyle(
                              fontSize: Responsive().mediumW,
                            ),
                          ),
                        ),
                        endChild: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: Responsive().extraLargeH,
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Responsive().smallW,
                                ),
                                GestureDetector(
                                  child: Obx(() {
                                    return Container(
                                      width: Responsive().width * 0.5,
                                      child: Text(
                                          "${_controller.jobApplication.value?.stages[index].title ?? ''}"),
                                    );
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
                        if (_controller
                                .jobApplication.value?.stages[index].id ==
                            _controller.editThisStagebyId.value) {
                          return _addEditStageField(context, true);
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  );
                },
              ),
              Obx(() {
                if (_controller.editThisStagebyId.value?.isEmpty ?? false)
                  return _addEditStageField(context, false);
                else
                  return Container();
              })
            ],
          ),
        );
      }),
    );
  }

  Column _addEditStageField(BuildContext context, bool isEdit) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: TextFormField(
            initialValue: _controller.selectedStageTitle.value ?? '',
            onSaved: (val) {
              _controller.selectedStageTitle.value = val;
            },
            validator: (val) => FormValidator().isNullOrEmpty(val),
            decoration: inputDecoration(labelText: 'Phone Screening'),
          ),
          trailing: GestureDetector(
            onTap: () async {
              _controller.pickedStageDate.value = await _pickDate(context);
            },
            child: Obx(() {
              return Text(
                formatDate(
                  _controller.pickedStageDate.value ?? DateTime.now(),
                ),
              );
            }),
          ),
        ),
        Row(
          children: [
            if (isEdit)
              TextButton(
                onPressed: _onDelete,
                child: Text('Delete'),
              ),
            Spacer(),
            if (isEdit)
              TextButton(
                onPressed: _onCancelled,
                child: Text('Cancel'),
              ),
            OutlinedButton(
              onPressed: _onSaved,
              child: Text(isEdit ? 'Save' : 'Add'),
            ),
          ],
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
