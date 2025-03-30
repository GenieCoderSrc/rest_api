// import 'package:dio/dio.dart';
// import 'package:exceptions/exceptions.dart';
// import 'package:rest_api/data/data_sources/i_data_sources/i_rest_api_data_sender.dart';
// import 'package:rest_api/data/enums/method.dart';
// import 'package:rest_api/utils/i_utils/i_url_generator.dart';
// import 'package:rest_api/utils/i_utils/i_header_provider.dart';
// import 'package:rest_api/utils/i_utils/i_response_handler.dart';
// import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';
//
// class RestApiDataSenderDioImpl extends IRestApiDataSender {
//   final Dio dio;
//   final IResponseHandler<Response> iResponseHandler;
//   final IHeaderProvider iRestApiHeaderProvider;
//   final IApiPathUrlGenerator iApiPathUrlGenerator;
//   final IRestApiConfig iRestApiConfig;
//   final IHeaderProvider iHeaderProvider;
//
//   RestApiDataSenderDioImpl({
//     required this.dio,
//     required this.iRestApiConfig,
//     required this.iHeaderProvider,
//     required this.iResponseHandler,
//     required this.iRestApiHeaderProvider,
//     required this.iApiPathUrlGenerator,
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
//       String url = iApiPathUrlGenerator
//           .generatePathUrl(endPoint: endPoint, config: iRestApiConfig)
//           .toString();
//
//       // get headers
//       final Map<String, String> headers =
//           iHeaderProvider.getHeaders(accessToken);
//
//       // init response
//       Response response;
//
//       // check Method request
//       if (method == Method.POST) {
//         response =
//             await dio.post(url, data: data, options: Options(headers: headers));
//       } else if (method == Method.DELETE) {
//         response = await dio.delete(url, options: Options(headers: headers));
//       } else if (method == Method.PATCH) {
//         response = await dio.patch(url, options: Options(headers: headers));
//       } else {
//         response = await dio.get(
//           url,
//           queryParameters: data,
//           options: Options(headers: headers),
//         );
//       }
//
//       return iResponseHandler.handleResponse(response);
//     } catch (e) {
//       throw SomethingWentWrongException();
//     }
//   }
// }
