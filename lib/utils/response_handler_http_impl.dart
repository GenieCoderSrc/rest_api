import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/exceptions/exception_handler/rest_api_exception_handler.dart';
import 'package:rest_api/exceptions/exceptions_impl/common_exceptions_impl.dart';
import 'package:rest_api/extenstions/http_response_extensions.dart';
import 'package:rest_api/utils/i_utils/i_response_handler.dart';

class ResponseHandlerHttpImpl extends IResponseHandler<http.Response> {
  @override
  Map<String, dynamic> handleResponse(response) {
    try {
      if (response is http.Response) {
        debugPrint(
            'HttpResponseHandlerService | handleResponse | response.body: ${response.body.toString()}');

        // handle status code
        return response.handleResponse<Map<String, dynamic>>(
            onSuccess: () => jsonDecode(response.body) as Map<String, dynamic>);
      }
      // Invalid response type
      throw InvalidResponseDataException();
    } catch (e) {
      debugPrint(
          'HttpResponseHandlerService | handleResponse| Catch | error: $e');
      throw RestApiExceptionHandler.handleException(e);
    }
  }
}
