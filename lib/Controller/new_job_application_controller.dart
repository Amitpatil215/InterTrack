import 'package:get/get.dart';
import 'package:intertrack/Model/JobApplication.dart';

enum eventFrequency { noRepeat, everyWeek }

class NewJobApplicationController extends GetxController {
  final startDateTime = DateTime.now().obs;
  final frequency = eventFrequency.noRepeat.obs;

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

  var editThisStagebyId = '1'.obs;

  setEditThiStageById(String id) {
    if (editThisStagebyId.value == id) {
      editThisStagebyId.value = '';
      return;
    }
    editThisStagebyId.value = id;
  }
}