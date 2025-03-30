// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boolean_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooleanResponseModel _$BooleanResponseModelFromJson(
        Map<String, dynamic> json) =>
    BooleanResponseModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int? ?? 0,
      data: json['data'] as bool? ?? false,
    );

Map<String, dynamic> _$BooleanResponseModelToJson(
    BooleanResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('message', instance.message);
  writeNotNull('statusCode', instance.statusCode);
  writeNotNull('data', instance.data);
  return val;
}
