// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<T> _$ResponseModelFromJson<T>(Map<String, dynamic> json) =>
    ResponseModel<T>(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      statusCode: json['statusCode'] as int? ?? 0,
      data: HttpResponseDataParser.dataFromJson(json['data']),
    );

Map<String, dynamic> _$ResponseModelToJson<T>(ResponseModel<T> instance) {
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
