import 'package:get/get.dart';
import 'package:intertrack/Model/JobApplication.dart';
import 'package:intertrack/Utils/constant.dart';

enum eventFrequency { noRepeat, everyWeek }

class JobApplicationsController extends GetxController {
  /// typically used to get more details on tapping one of job using its id
  RxString selectedJobApplicationId = ''.obs;

  List<JobApplication> jobApplications = [
    for (int i = 0; i < 2; i++)
      JobApplication(
        id: '$i',
        companyName: "Amazon Pvt Ltd",
        dateOfApplication: DateTime.now().subtract(Duration(days: 4)),
        isApplied: false,
        jobType: JobType.Internship,
        position: 'Product Manager',
        statusLabel: ApplicationStatus.Interviewing,
        stages: [
          Stage(
            id: '1',
            title: 'Telephonic Round',
            scheduledOn: DateTime.now(),
          ),
          Stage(
            id: '2',
            title: 'Onsite Round',
            scheduledOn: DateTime.now().add(
              Duration(days: 10),
            ),
          ),
        ],
      ),
  ].obs;

  void appendNewJobApplication(JobApplication jobApplication) {
    jobApplications.add(jobApplication);
  }

  /// Reset selectedJobApplicationId
  void resetSelectedJobApplicationId() {
    this.selectedJobApplicationId = ''.obs;
  }
}
