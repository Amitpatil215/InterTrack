import 'package:intertrack/Utils/constant.dart';

class JobApplication {
  final String id;
  String companyName;
  final String referenceUrl;
  final String imageUrl;

  /// e.g. SDE1
  String position;
  JobType jobType;
  final DateTime? expectedDate;
  DateTime? dateOfApplication;

  /// e.g. under review
  ApplicationStatus statusLabel;
  bool isApplied;

  /// e.g. phone screening
  final List<Stage> stages;

  JobApplication({
    this.id = '',
    this.companyName = '',
    this.referenceUrl = '',
    this.position = '',
    this.jobType = JobType.FullTime,
    this.imageUrl = '',
    this.expectedDate,
    this.dateOfApplication,
    this.statusLabel = ApplicationStatus.Researching,
    this.isApplied = false,
    required this.stages,
  });
}

class Stage {
  final String id;
  final String title;
  final DateTime? scheduledOn;

  Stage({
    this.id = '',
    this.title = '',
    this.scheduledOn,
  });
}
