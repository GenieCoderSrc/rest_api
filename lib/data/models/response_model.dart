import 'package:json_annotation/json_annotation.dart';
import 'package:rest_api/domain/entity/response_entity.dart';
import 'package:rest_api/utils/http_response_data_parser.dart';

part 'response_model.g.dart';
// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ResponseModel<T> extends ResponseEntity<T> {
  @override
  @JsonKey(defaultValue: false)
  final bool? status;
  @override
  final String? message;
  @override
  @JsonKey(defaultValue: 0)
  final int? statusCode;
  @override
  @JsonKey(
      fromJson: HttpResponseDataParser.dataFromJson,
      toJson: HttpResponseDataParser.dataToJson)
  final T? data;

  ResponseModel({
    this.message,
    this.status,
    this.statusCode,
    this.data,
  }) : super(
          message: message,
          status: status,
          statusCode: statusCode,
          data: data,
        );

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

// json: {status: false, message: User already exist, statusCode: 0, data: false}
