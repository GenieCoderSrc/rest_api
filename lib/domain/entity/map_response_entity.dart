import 'package:json_annotation/json_annotation.dart';

part 'map_response_entity.g.dart';
// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MapResponseEntity {
  @JsonKey(defaultValue: false)
  final bool? status;
  final String? message;
  @JsonKey(defaultValue: 0)
  final int? statusCode;

  final Map<String, dynamic>? data;

  MapResponseEntity({this.status, this.message, this.statusCode, this.data});

  factory MapResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$MapResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MapResponseEntityToJson(this);
}
