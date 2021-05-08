// import 'package:json_annotation/json_annotation.dart';

// part 'Stage.g.dart';

// @JsonSerializable()
class Stage {
  final String id;
  final String title;
  final DateTime? scheduledOn;

  Stage({
    this.id = '',
    this.title = '',
    this.scheduledOn,
  });

  factory Stage.fromJson(Map<String, dynamic> item) => _$StageFromJson(item);
  Map<String, dynamic> toJson() => _$StageToJson(this);
}

Stage _$StageFromJson(Map<String, dynamic> json) {
  return Stage(
    id: json['id'] as String,
    title: json['title'] as String,
    scheduledOn: json['scheduledOn'] == null
        ? null
        : DateTime.parse(json['scheduledOn'] as String),
  );
}

Map<String, dynamic> _$StageToJson(Stage instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'scheduledOn': instance.scheduledOn?.toIso8601String(),
    };
