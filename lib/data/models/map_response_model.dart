import 'package:json_annotation/json_annotation.dart';
import 'package:rest_api/domain/entity/map_response_entity.dart';

part 'map_response_model.g.dart';
// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MapResponseModel extends MapResponseEntity {
  @override
  @JsonKey(defaultValue: false)
  final bool? status;
  @override
  final String? message;
  @override
  @JsonKey(defaultValue: 0)
  final int? statusCode;
  @override
  final Map<String, dynamic>? data;

  MapResponseModel({
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

  factory MapResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MapResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MapResponseModelToJson(this);
}

// RestApiDataServiceHttpImpl | request | response body:
// {"status":true,"message":"Email sent successfully","statusCode":0,
// "data":{"email":"shoikatithome@gmail.com","message":null}}
