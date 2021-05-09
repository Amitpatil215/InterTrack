import 'package:intertrack/Model/Model.dart';
import 'package:intertrack/Utils/constant.dart';

class JobApplication {
  final String id;
  String userId;
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
  bool isDeleted;

  /// e.g. phone screening
  final List<Stage> stages;

  JobApplication({
    this.id = '',
    this.userId = '',
    this.companyName = '',
    this.referenceUrl = '',
    this.position = '',
    this.jobType = JobType.FullTime,
    this.imageUrl = '',
    this.expectedDate,
    this.dateOfApplication,
    this.statusLabel = ApplicationStatus.Researching,
    this.isApplied = false,
    this.isDeleted = false,
    required this.stages,
  });

  factory JobApplication.fromJson(Map<String, dynamic> item, String id) =>
      _$JobApplicationFromJson(item, id);
  Map<String, dynamic> toJson() => _$JobApplicationToJson(this);
}

JobApplication _$JobApplicationFromJson(Map<String, dynamic> json, String id) {
  return JobApplication(
    id: id,
    userId: json['userId'] as String,
    companyName: json['companyName'] as String,
    referenceUrl: json['referenceUrl'] as String,
    position: json['position'] as String,
    jobType: _$enumDecode(_$JobTypeEnumMap, json['jobType']),
    imageUrl: json['imageUrl'] as String,
    expectedDate: json['expectedDate'] == null
        ? null
        : DateTime.parse(json['expectedDate'] as String),
    dateOfApplication: json['dateOfApplication'] == null
        ? null
        : DateTime.parse(json['dateOfApplication'] as String),
    statusLabel: _$enumDecode(_$ApplicationStatusEnumMap, json['statusLabel']),
    isApplied: json['isApplied'] as bool,
    isDeleted: json['isDeleted'] as bool,
    stages: (json['stages'] as List<dynamic>)
        .map((e) => Stage.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$JobApplicationToJson(JobApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'companyName': instance.companyName,
      'referenceUrl': instance.referenceUrl,
      'imageUrl': instance.imageUrl,
      'position': instance.position,
      'jobType': _$JobTypeEnumMap[instance.jobType],
      'expectedDate': instance.expectedDate?.toIso8601String(),
      'dateOfApplication': instance.dateOfApplication?.toIso8601String(),
      'statusLabel': _$ApplicationStatusEnumMap[instance.statusLabel],
      'isApplied': instance.isApplied,
      'isDeleted': instance.isDeleted,
      'stages': instance.stages.map((e) => e.toJson()).toList(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$JobTypeEnumMap = {
  JobType.PartTime: 'PartTime',
  JobType.FullTime: 'FullTime',
  JobType.Remote: 'Remote',
  JobType.Internship: 'Internship',
  JobType.Contract: 'Contract',
  JobType.Trainig: 'Trainig',
};

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.Researching: 'Researching',
  ApplicationStatus.Applied: 'Applied',
  ApplicationStatus.UnderReview: 'UnderReview',
  ApplicationStatus.Interviewing: 'Interviewing',
  ApplicationStatus.Rejected: 'Rejected',
  ApplicationStatus.Closed: 'Closed',
  ApplicationStatus.Hired: 'Hired',
};
