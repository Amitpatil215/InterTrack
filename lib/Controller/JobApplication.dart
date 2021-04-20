import 'package:get/get.dart';
import 'package:intertrack/Model/JobApplication.dart';

enum eventFrequency { noRepeat, everyWeek }

class JobApplicationController extends GetxController {
  final startDateTime = DateTime.now().obs;
  final frequency = eventFrequency.noRepeat.obs;

  List<JobApplication> jobApplications = [
    JobApplication(
      companyName: "Amazon",
    )
  ];

  /// Hiring Stages
  List<Stage> stages = [
    Stage(
      id: '1',
      title: 'Telephonic Round',
      scheduledOn: DateTime.now(),
    ),
    Stage(
      id: '1',
      title: 'Telephonic Round',
      scheduledOn: DateTime.now(),
    ),
  ];
}
