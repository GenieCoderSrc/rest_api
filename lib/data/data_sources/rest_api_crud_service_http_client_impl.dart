// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';
// import 'package:rest_api/data/data_sources/i_data_sources/i_rest_api_data_sender.dart';
// import 'package:rest_api/utils/i_utils/i_url_generator.dart';
// import 'package:rest_api/utils/i_utils/i_header_provider.dart';
// import 'package:rest_api/utils/i_utils/i_response_handler.dart';
// import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';
//
// import 'i_data_sources/i_rest_api_crud_service.dart';
//
// class RestApiCrudServiceHttpClientImpl extends IRestApiCrudService {
//   final Client client;
//   final IRestApiDataSender iRestApiDataSender;
//   final IResponseHandler iRestApiResponseHandlerService;
//
//   final IHeaderProvider iRestApiHeaderProvider;
//   final IApiPathUrlGenerator iApiPathUrlGenerator;
//   final IRestApiConfig iRestApiConfig;
//
//   RestApiCrudServiceHttpClientImpl({
//     required this.iRestApiHeaderProvider,
//     required this.iApiPathUrlGenerator,
//     required this.iRestApiConfig,
//     required this.client,
//     required this.iRestApiDataSender,
//     required this.iRestApiResponseHandlerService,
//   });
//
//   @override
//   Future<bool> addData(
//       {String? accessToken,
//       required String endPoint,
//       required Map<String, dynamic> data}) async {
//     try {
//       // get url
//       Uri url = iApiPathUrlGenerator.generatePathUrl(
//           endPoint: endPoint, config: iRestApiConfig);
//
//       // get headers
//       final Map<String, String> headers =
//           iRestApiHeaderProvider.getHeaders(accessToken);
//
//       // post data
//       final Response response =
//           await client.post(url, headers: headers, body: jsonEncode(data));
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> map = jsonDecode(response.body);
//         return map['data'] == true;
//       }
//
//       return false;
//     } catch (e) {
//       debugPrint('RemoteDataServiceHttpImpl | addData | error: $e');
//       return false;
//     }
//   }
//
//   @override
//   Future<bool> deleteData(
//       {required Map<String, dynamic> data,
//       String? accessToken,
//       required String endPoint}) async {
//     try {
//       // get url
//       Uri url = iApiPathUrlGenerator.generatePathUrl(
//           endPoint: endPoint, config: iRestApiConfig);
//
//       // get headers
//       final Map<String, String> headers =
//           iRestApiHeaderProvider.getHeaders(accessToken);
//
//       // delete data
//       final Response response =
//           await client.delete(url, body: jsonEncode(data), headers: headers);
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> map = jsonDecode(response.body);
//         return map['data'] == true;
//       }
//       return false;
//     } catch (e) {
//       debugPrint('RemoteDataServiceHttpImpl | deleteData | error: $e');
//       return false;
//     }
//   }
//
//   @override
//   Future<List<Map<String, dynamic>>?> getAllDataList(
//       {String? accessToken,
//       required String endPoint,
//       Map<String, dynamic>? data}) async {
//     try {
//       // get url
//       Uri url = iApiPathUrlGenerator.generatePathUrl(
//           endPoint: endPoint, config: iRestApiConfig, keyParams: data);
//
//       // get headers
//       final Map<String, String> headers =
//           iRestApiHeaderProvider.getHeaders(accessToken);
//
//       // get data
//       final Response response = await client.get(url, headers: headers);
//
//       return iRestApiResponseHandlerService.handleResponse(response)
//           as List<Map<String, dynamic>>?;
//     } catch (e) {
//       debugPrint('RemoteDataServiceHttpImpl | getAllDataList | error: $e');
//       throw Exception(e);
//     }
//   }
//
//   @override
//   Future<Map<String, dynamic>?> getData(
//       {Map<String, dynamic>? data,
//       String? accessToken,
//       required String endPoint}) async {
//     try {
//       // get url
//       Uri url = iApiPathUrlGenerator.generatePathUrl(
//           endPoint: endPoint, config: iRestApiConfig, keyParams: data);
//
//       // get headers
//       final Map<String, String> headers =
//           iRestApiHeaderProvider.getHeaders(accessToken);
//
//       // get data
//       final Response response = await client.get(url, headers: headers);
//
//       return iRestApiResponseHandlerService.handleResponse(response);
//     } catch (e) {
//       debugPrint('RemoteDataServiceHttpImpl | getAllDataList | error: $e');
//       throw Exception(e);
//     }
//   }
//
//   @override
//   Future<bool> updateData(
//       {required Map<String, dynamic> data,
//       String? accessToken,
//       required String endPoint}) async {
//     try {
//       // get url
//       Uri url = iApiPathUrlGenerator.generatePathUrl(
//           endPoint: endPoint, config: iRestApiConfig, keyParams: data);
//
//       // get headers
//       final Map<String, String> headers =
//           iRestApiHeaderProvider.getHeaders(accessToken);
//
//       // delete data
//       final Response response =
//           await client.patch(url, body: jsonEncode(data), headers: headers);
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> map = jsonDecode(response.body);
//         return map['data'] == true;
//       }
//       return false;
//     } catch (e) {
//       debugPrint('RemoteDataServiceHttpImpl | updateData | error: $e');
//       return false;
//     }
//   }
// }
