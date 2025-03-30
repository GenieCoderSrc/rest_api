import 'package:json_annotation/json_annotation.dart';
import 'package:rest_api/utils/http_response_data_parser.dart';

part 'response_entity.g.dart';
// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ResponseEntity<T> {
  @JsonKey(defaultValue: false)
  final bool? status;
  final String? message;
  @JsonKey(defaultValue: 0)
  final int? statusCode;
  @JsonKey(
      fromJson: HttpResponseDataParser.dataFromJson,
      toJson: HttpResponseDataParser.dataToJson)
  final T? data;
  ResponseEntity({this.status, this.message, this.statusCode, this.data});

  factory ResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseEntityToJson(this);
}
