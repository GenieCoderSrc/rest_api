// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';
// import 'package:rest_api/data/data_sources/i_data_sources/i_rest_api_data_sender.dart';
// import 'package:rest_api/data/enums/method.dart';
// import 'package:rest_api/exceptions/exception_handler/rest_api_exception_handler.dart';
// import 'package:rest_api/utils/i_utils/i_url_generator.dart';
// import 'package:rest_api/utils/i_utils/i_header_provider.dart';
// import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';
//
// import '../../utils/i_utils/i_response_handler.dart';
//
// class RestApiDataSenderHttpMethodsImpl extends IRestApiDataSender {
//   final Client client;
//   final IRestApiConfig iRestApiConfig;
//   final IHeaderProvider iHeaderProvider;
//   final IApiPathUrlGenerator iApiPathUrlGenerator;
//   final IResponseHandler<Response> iResponseHandler;
//
//   RestApiDataSenderHttpMethodsImpl({
//     required this.client,
//     required this.iResponseHandler,
//     required this.iHeaderProvider,
//     required this.iApiPathUrlGenerator,
//     required this.iRestApiConfig,
//   });
//
//   @override
//   Future<Map<String, dynamic>> sendRequest(
//       {required String endPoint,
//       required Method method,
//       String? accessToken,
//       Map<String, dynamic>? data}) async {
//     try {
//       // get url
//       Uri url = iApiPathUrlGenerator.generatePathUrl(
//           endPoint: endPoint, config: iRestApiConfig);
//
//       // get headers
//       final Map<String, String> headers =
//           iHeaderProvider.getHeaders(accessToken);
//
//       Response response;
//       // check Method request
//       if (method == Method.POST) {
//         // post data
//         response =
//             await client.post(url, body: jsonEncode(data), headers: headers);
//       } else if (method == Method.DELETE) {
//         // delete data
//         response =
//             await client.delete(url, body: jsonEncode(data), headers: headers);
//       } else if (method == Method.PATCH) {
//         // update partial data
//         response =
//             await client.patch(url, body: jsonEncode(data), headers: headers);
//       } else if (method == Method.PUT) {
//         // update entire data
//         response =
//             await client.put(url, body: jsonEncode(data), headers: headers);
//       } else {
//         // get path
//         url = iApiPathUrlGenerator.generatePathUrl(
//           config: iRestApiConfig,
//           endPoint: endPoint,
//           keyParams: data,
//         );
//
//         // get data
//         response = await client.get(url, headers: headers);
//       }
//
//       // handle exceptions
//       return iResponseHandler.handleResponse(response);
//     } catch (e) {
//       debugPrint(
//           'HttpResponseHandlerService | handleResponse| Catch | error: $e');
//       throw HttpExceptionHandler.handleException(e);
//     }
//   }
// }
//
// // if (response.statusCode == 200) {
// // return jsonDecode(response.body) as Map<String, dynamic>;
// // }
// //
// // // handle status code
// // throw HttpStatusCodeHandler.handle(response.statusCode);
