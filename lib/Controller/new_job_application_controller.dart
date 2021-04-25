import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Utils/constant.dart';
import 'package:intertrack/Utils/date_formats.dart';
import 'package:uuid/uuid.dart';
import 'package:intertrack/Model/JobApplication.dart';

enum eventFrequency { noRepeat, everyWeek }

class NewJobApplicationController extends GetxController {
  Rx<JobApplication> jobApplication = JobApplication(stages: [
    Stage(
      id: '1',
      title: 'Telephonic Interview',
      scheduledOn: DateTime.now(),
    ),
    Stage(
      id: '2',
      title: 'Coding Round',
      scheduledOn: DateTime.now(),
    )
  ]).obs;

  //* Company name and date of application
  Rx<TimeOfDay> pickedApplicationTime = TimeOfDay.now().obs;
  Rx<DateTime> pickedApplicationDate = DateTime.now().obs;

  setCompanyName(String name) {
    jobApplication.value?.companyName = name;
    jobApplication.refresh();
  }

  //* Job description
  setJobType(JobType jobType) {
    jobApplication.value?.jobType = jobType;
    jobApplication.refresh();
  }

  setJobPosition(String position) {
    jobApplication.value?.position = position;
    jobApplication.refresh();
  }

  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  JobApplication? onSaved() {
    if (formKey.value?.currentState?.validate() ?? false) {
      formKey.value?.currentState?.save();

      jobApplication.value?.dateOfApplication = timeOfDayToDateTime(
        pickedApplicationTime.value!,
        dateTime: pickedApplicationDate.value,
      );
      inspect(jobApplication.value);
      return jobApplication.value;
    }
    return jobApplication.value;
  }

  //* Job application status
  setJobApplicationStatus(bool isSubmitted) {
    jobApplication.value?.isApplied = isSubmitted;
    jobApplication.refresh();
  }

  setApplicationStatusLabel(ApplicationStatus status) {
    jobApplication.value?.statusLabel = status;
    jobApplication.refresh();
  }

  //* Hiring Stages
  Rx<DateTime> pickedStageDate = DateTime.now().obs;
  RxString selectedStageTitle = ''.obs;
  RxString editThisStagebyId = ''.obs;
  RxString selectedStageId = ''.obs;

  setEditThiStageById(String id) {
    if (editThisStagebyId.value == id) {
      editThisStagebyId.value = '';
      return;
    }
    editThisStagebyId.value = id;
  }

  addNewStage(Stage stage) {
    jobApplication.value?.stages.add(Stage(
      id: Uuid().v1(),
      scheduledOn: stage.scheduledOn,
      title: stage.title,
    ));
    jobApplication.refresh();
  }

  editStage(Stage stage) {
    jobApplication.value?.stages.forEach((element) {
      if (element.id == stage.id) {
        removeStageById(stage.id, false);
        addNewStage(stage);
        return;
      }
    });

    jobApplication.refresh();
  }

  removeStageById(String id, bool refreshObservable) {
    jobApplication.value?.stages.removeWhere((element) => element.id == id);
    if (refreshObservable) jobApplication.refresh();
  }

  setSelectedStageInfo(String id) {
    jobApplication.value?.stages.forEach((element) {
      if (element.id == id) {
        selectedStageId.value = element.id;
        selectedStageTitle.value = element.title;
        pickedStageDate.value = element.scheduledOn;
      }
    });
  }

  //* Init all the controllers for editing the job application
  void initFieldsInSheet(JobApplication jobApplication) {
    this.jobApplication.value = jobApplication;
  }

  //* Empty init all the controllers for new job application
  void resetAllFieldsInSheet() {
    this.jobApplication = JobApplication().obs;
  }
}
