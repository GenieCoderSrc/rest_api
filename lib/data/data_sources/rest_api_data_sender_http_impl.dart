import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:rest_api/data/data_sources/i_data_sources/i_rest_api_data_sender.dart';
import 'package:rest_api/data/enums/method.dart';
import 'package:rest_api/exceptions/exception_handler/rest_api_exception_handler.dart';
import 'package:rest_api/utils/i_utils/i_header_provider.dart';
import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';
import 'package:rest_api/utils/i_utils/i_url_generator.dart';

import '../../utils/i_utils/i_response_handler.dart';

class RestApiDataSenderHttpImpl extends IRestApiDataSender {
  final Client client;
  final IResponseHandler<Response> iResponseHandler;
  final IHeaderProvider iRestApiHeaderProvider;
  final IUrlGenerator iApiPathUrlGenerator;
  final IRestApiConfig iRestApiConfig;

  RestApiDataSenderHttpImpl({
    required this.iRestApiConfig,
    required this.client,
    required this.iResponseHandler,
    required this.iRestApiHeaderProvider,
    required this.iApiPathUrlGenerator,
  });

  @override
  Future<Map<String, dynamic>?> sendRequest(
      {required String endPoint,
      required Method method,
      String? accessToken,
      Map<String, dynamic>? data}) async {
    try {
      // get url
      Uri url = iApiPathUrlGenerator.generatePathUrl(
          endPoint: endPoint, config: iRestApiConfig);

      final Request request = Request(method.name, url);

      // get headers
      Map<String, String> headers =
          iRestApiHeaderProvider.getHeaders(accessToken);
      request.headers.addAll(headers);

      // encrypt data
      if (data != null) {
        request.body = jsonEncode(data);
      }

      // send request
      final StreamedResponse streamedResponse = await client.send(request);
      final Response response = await Response.fromStream(streamedResponse);

      debugPrint(
          'RestApiDataSenderHttpImpl | request | response body: ${response.body.toString()}');

      // handle Response data &  exceptions
      return iResponseHandler.handleResponse(response);
    } catch (e) {
      throw RestApiExceptionHandler.handleException(e);
    }
  }
}
