class Constant {
  /// Naviagtion routs
  static const routeJobApplicationDetails = '/jobApplicationDetails';
  static const routeDebug = '/debugScreen';
  static const routeCreatingUser = '/creatingUserScreen';
}

//* Enums
enum JobType {
  PartTime,
  FullTime,
  Remote,
  Internship,
  Contract,
  Trainig,
}
enum ApplicationStatus {
  Researching,
  Applied,
  UnderReview,
  Interviewing,
  Rejected,
  Closed,
  Hired,
}
