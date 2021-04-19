class JobApplication {
  final String id;
  final String companyName;
  final String referenceUrl;
  final String imageUrl;

  /// e.g. SDE1
  final String position;
  final DateTime? expectedDate;
  final DateTime? dateOfApplication;

  /// e.g. under review
  final String statusLabel;
  final bool isApplied;

  /// e.g. phone screening
  final List<Stage> stages;

  JobApplication({
    this.id = '',
    this.companyName = '',
    this.referenceUrl = '',
    this.position = '',
    this.imageUrl = '',
    this.expectedDate,
    this.dateOfApplication,
    this.statusLabel = '',
    this.isApplied = false,
    this.stages = const [],
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
