// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapResponseEntity _$MapResponseEntityFromJson(Map<String, dynamic> json) =>
    MapResponseEntity(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int? ?? 0,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MapResponseEntityToJson(MapResponseEntity instance) {
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
