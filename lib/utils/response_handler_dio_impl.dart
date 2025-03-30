import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rest_api/exceptions/exception_handler/rest_api_exception_handler.dart';
import 'package:rest_api/exceptions/exceptions_impl/common_exceptions_impl.dart';
import 'package:rest_api/extenstions/http_status_code_extenstions.dart';
import 'package:rest_api/utils/i_utils/i_response_handler.dart';

class ResponseHandlerDioImpl extends IResponseHandler<Response> {
  @override
  Map<String, dynamic>? handleResponse(response) {
    try {
      if (response is Response) {
        if (response.statusCode == 200 && response.data != null) {
          return jsonDecode(response.data);
        }

        // handle status code
        throw response.statusCode.handleException();
      }
      // Invalid response type
      throw InvalidResponseDataException();
    } catch (e) {
      debugPrint('ResponseHandlerDioImpl | handleResponse| Catch | error: $e');
      throw RestApiExceptionHandler.handleException(e);
    }
  }
}
