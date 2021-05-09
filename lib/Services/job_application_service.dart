import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intertrack/Model/Model.dart';

class JobApplicationService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<DocumentReference> addJobApplication(
      JobApplication jobApplication) async {
    return _firebaseFirestore
        .collection('applications')
        .add(jobApplication.toJson());
  }

  Stream<QuerySnapshot> getAllJobApplications(String userId) {
    return _firebaseFirestore
        .collection('applications')
        .where('userId', isEqualTo: userId)
        .where('isDeleted', isEqualTo: false)
        .snapshots();
  }

  Future<void> editJobApplication(JobApplication jobApplication) async {
    return _firebaseFirestore
        .collection('applications')
        .doc(jobApplication.id)
        .update(jobApplication.toJson());
  }

  Future<void> deleteJobApplication(String jobApplicationId) async {
    return _firebaseFirestore
        .collection('applications')
        .doc(jobApplicationId)
        .update({'isDeleted': true});
  }
}
