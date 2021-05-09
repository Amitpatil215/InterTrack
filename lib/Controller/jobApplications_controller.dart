import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intertrack/Model/Model.dart';
import 'package:intertrack/Services/job_application_service.dart';
import 'package:intertrack/Utils/constant.dart';

enum eventFrequency { noRepeat, everyWeek }

class JobApplicationsController extends GetxController {
  /// typically used to get more details on tapping one of job using its id
  /// also used for mode of editing sheet, ifEmpty considered as new application
  /// if isNotExmpty then considered as in editing mode
  RxString selectedJobApplicationId = ''.obs;
  final _uid = FirebaseAuth.instance.currentUser?.uid;
  final JobApplicationService _jobApplicationService = JobApplicationService();
  final RxList<JobApplication> _jobApplications = [
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

  RxList<JobApplication> get jobApplications {
    return _jobApplications;
  }

  int? getIndexOfJobApplicationFromListById(String id) {
    int _index = _jobApplications.indexWhere((element) => element.id == id);
    if (_index >= 0) {
      return _index;
    } else
      return null;
  }

  Future<void> getAllJobApplications() async {
    if (_uid != null) {
      try {
        _jobApplicationService.getAllJobApplications(_uid!).listen((event) {
          _jobApplications.clear();
          event.docs.forEach((element) {
            _jobApplications
                .add(JobApplication.fromJson(element.data(), element.id));
          });
        });
      } catch (er) {
        print(er);
      }
    }
  }

  void appendNewJobApplication(JobApplication jobApplication) async {
    if (_uid != null) {
      jobApplication.userId = _uid!;
      try {
        await _jobApplicationService.addJobApplication(
          jobApplication,
        );
      } catch (er) {
        print(er);
      }
    }
  }

  void editJobApplication(JobApplication jobApplication) async {
    try {
      await _jobApplicationService.editJobApplication(
        jobApplication,
      );
    } catch (er) {
      print(er);
    }
  }

  void deleteJobApplicationById(String id) async {
    if (id.isEmpty) return;

    try {
      await _jobApplicationService.deleteJobApplication(
        id,
      );
    } catch (er) {
      print(er);
    }
  }

  /// Reset selectedJobApplicationId
  void resetSelectedJobApplicationId() {
    this.selectedJobApplicationId = ''.obs;
  }
}
