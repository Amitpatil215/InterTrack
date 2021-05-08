import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intertrack/Model/Model.dart';

class JobApplicationService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<DocumentReference> addJobApplication(
      JobApplication jobApplication, String userId) async {
    return _firebaseFirestore
        .collection('applications')
        .doc(userId)
        .collection('applicationList')
        .add(jobApplication.toJson()
            // "companyName": jobApplication.companyName,
            // "referenceUrl": jobApplication.referenceUrl,
            // "imageUrl": jobApplication.imageUrl,
            // " position": jobApplication.position,
            // "jobType": describeEnum(jobApplication.jobType),
            // "expectedDate": jobApplication.expectedDate,
            // "dateOfApplication": jobApplication.dateOfApplication,
            // "statusLabel": describeEnum(jobApplication.statusLabel),
            // "isApplied": jobApplication.isApplied,
            // "stages": jobApplication.stages
            );
  }
}
