import 'package:json_annotation/json_annotation.dart';
import 'package:rest_api/domain/entity/boolean_response_entity.dart';

part 'boolean_response_model.g.dart';
// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class BooleanResponseModel extends BooleanResponseEntity {
  @override
  @JsonKey(defaultValue: false)
  final bool? status;
  @override
  final String? message;
  @override
  @JsonKey(defaultValue: 0)
  final int? statusCode;
  @override
  @JsonKey(defaultValue: false)
  final bool? data;

  BooleanResponseModel({
    this.status,
    this.message,
    this.statusCode,
    this.data,
  }) : super(
          status: status,
          message: message,
          statusCode: statusCode,
          data: data,
        );

  factory BooleanResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BooleanResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BooleanResponseModelToJson(this);
}
