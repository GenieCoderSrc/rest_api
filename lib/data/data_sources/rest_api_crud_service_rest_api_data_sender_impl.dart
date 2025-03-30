import 'package:flutter/foundation.dart';
import 'package:rest_api/data/data_sources/i_data_sources/i_rest_api_data_sender.dart';
import 'package:rest_api/data/enums/method.dart';
import 'package:rest_api/data/models/response_model.dart';

import 'i_data_sources/i_rest_api_crud_service.dart';

class RestApiCrudServiceRestApiDataSenderImpl extends IRestApiCrudService {
  final IRestApiDataSender iRestApiDataSender;

  RestApiCrudServiceRestApiDataSenderImpl({required this.iRestApiDataSender});

  @override
  Future<Map<String, dynamic>?> addData(
      {required Map<String, dynamic> data,
      String? accessToken,
      required String endPoint}) async {
    try {
      // Map<String, dynamic>? json = await iRestApiDataSender.sendRequest(
      return await iRestApiDataSender.sendRequest(
        data: data,
        endPoint: endPoint,
        method: Method.POST,
        accessToken: accessToken,
      );
    } catch (e) {
      debugPrint(
          'RestApiCrudServiceRestApiDataSenderImpl | addData | error: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> updateData(
      {required Map<String, dynamic> data,
      String? accessToken,
      required String endPoint}) async {
    try {
      return await iRestApiDataSender.sendRequest(
        data: data,
        endPoint: endPoint,
        method: Method.PATCH,
        accessToken: accessToken,
      );

      // // Map<String, dynamic>? map =
      // //     iParseHttpResponseData.parseResponseData(json);
      // //
      // // return map?['data'] == true;
      //
      // return json != null ? ResponseModel.fromJson(json) : null;
    } catch (e) {
      debugPrint(
          'RestApiCrudServiceRestApiDataSenderImpl | updateData | error: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> deleteData({
    String? accessToken,
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await iRestApiDataSender.sendRequest(
        data: data,
        endPoint: endPoint,
        method: Method.DELETE,
        accessToken: accessToken,
      );

      // // Map<String, dynamic>? map =
      // //     iParseHttpResponseData.parseResponseData(json);
      // //
      // // return map?['data'] == true;
      //
      // return json != null ? ResponseModel.fromJson(json) : null;
    } catch (e) {
      debugPrint(
          'RestApiCrudServiceRestApiDataSenderImpl | deleteData | error: $e');
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>?> getAllDataList(
      {String? accessToken,
      required String endPoint,
      Map<String, dynamic>? data}) async {
    try {
      Map<String, dynamic>? json = await iRestApiDataSender.sendRequest(
        data: data,
        endPoint: endPoint,
        method: Method.GET,
        accessToken: accessToken,
      );

      debugPrint(
          'RestApiCrudServiceRestApiDataSenderImpl | getAllDataList | json: ${json.toString()}');

      if (json != null) {
        final ResponseModel responseModel =
            ResponseModel<List<Map<String, dynamic>>>.fromJson(json);

        return responseModel.data?.entries
            .map((data) => data as Map<String, dynamic>)
            .toList();
      }
      // return json != null ? ResponseModel.fromJson(json) : null;
      return null;
    } catch (e) {
      debugPrint(
          'RestApiCrudServiceRestApiDataSenderImpl | getAllDataList | error: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> getData(
      {Map<String, dynamic>? data,
      String? accessToken,
      required String endPoint}) async {
    try {
      return await iRestApiDataSender.sendRequest(
        data: data,
        endPoint: endPoint,
        method: Method.GET,
        accessToken: accessToken,
      );

      // if (json != null) {
      //   final ResponseEntity responseEntity =
      //       ResponseEntity<Map<String, dynamic>>.fromJson(json);
      //
      //   return responseEntity.data;
      // }
      //
      // // return iParseHttpResponseData.parseResponseData(json);
      // // // .then((data) => data['data'] as Map<String, dynamic?>);
      //
      // // return json != null ? ResponseModel.fromJson(json) : null;
      // return null;
    } catch (e) {
      debugPrint(
          'RestApiCrudServiceRestApiDataSenderImpl | getData | error: $e');
      rethrow;
    }
  }
}
