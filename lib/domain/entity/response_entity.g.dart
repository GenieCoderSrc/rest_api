// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseEntity<T> _$ResponseEntityFromJson<T>(Map<String, dynamic> json) =>
    ResponseEntity<T>(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int? ?? 0,
      data: HttpResponseDataParser.dataFromJson(json['data']),
    );

Map<String, dynamic> _$ResponseEntityToJson<T>(ResponseEntity<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('message', instance.message);
  writeNotNull('statusCode', instance.statusCode);
  writeNotNull('data', HttpResponseDataParser.dataToJson(instance.data));
  return val;
}
