import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:rest_api/exceptions/exception_handler/rest_api_exception_handler.dart';

import 'i_data_sources/i_http_methods.dart';

class HttpPutMethod implements IHttpMethod {
  final Client client;

  HttpPutMethod(this.client);

  @override
  Future<Map<String, dynamic>> execute(
    Uri url,
    Map<String, String> headers,
    Map<String, dynamic>? data,
  ) async {
    try {
      final response =
          await client.put(url, headers: headers, body: jsonEncode(data));
      return jsonDecode(response.body);
    } catch (e) {
      debugPrint('HttpPostMethod | execute| error: $e');
      throw RestApiExceptionHandler.handleException(e);
    }
  }
}
