import 'package:json_annotation/json_annotation.dart';

part 'boolean_response_entity.g.dart';
// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class BooleanResponseEntity {
  @JsonKey(defaultValue: false)
  final bool? status;
  final String? message;
  @JsonKey(defaultValue: 0)
  final int? statusCode;
  @JsonKey(defaultValue: false)
  final bool? data;

  BooleanResponseEntity({
    this.status,
    this.message,
    this.statusCode,
    this.data,
  });

  factory BooleanResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BooleanResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BooleanResponseEntityToJson(this);
}
