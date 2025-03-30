// import 'package:flutter/foundation.dart';
// import 'package:rest_api/domain/entity/response_entity.dart';
// import 'package:rest_api/utils/i_utils/i_parse_response_data.dart';
//
// class ParseHttpResponseData extends IParseHttpResponseData {
//   @override
//   Map<String, dynamic>? parseResponseData(BooleanResponseEntity? responseEntity) {
//     if (responseEntity != null) {
//       if (responseEntity.status == false) {
//         throw Exception(responseEntity.message ?? "Unknown error occurred");
//       }
//
//       debugPrint(
//           'HttpResponseHandlerService | handleResponse | json: ${responseEntity.toString()}');
//       // todo! return only json | not json?['data']
//       // todo create model as json response to taking response data with status & message
//       if (responseEntity.status == true && responseEntity.data != null) {
//         return responseEntity.data;
//       }
//     }
//
//     throw Exception("Failed to add data");
//   }
// }
