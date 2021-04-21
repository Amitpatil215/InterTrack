import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
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
        removeStageById(stage.id);
        addNewStage(stage);

        return;
      }
    });

    jobApplication.value?.stages.forEach((element) {
      if (element.id == stage.id) {
        print(element.title);
      }
    });
    jobApplication.refresh();
  }

  removeStageById(String id) {
    jobApplication.value?.stages.removeWhere((element) => element.id == id);
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
}
