// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boolean_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooleanResponseEntity _$BooleanResponseEntityFromJson(
        Map<String, dynamic> json) =>
    BooleanResponseEntity(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int? ?? 0,
      data: json['data'] as bool? ?? false,
    );

Map<String, dynamic> _$BooleanResponseEntityToJson(
    BooleanResponseEntity instance) {
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
