import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/exceptions/exceptions_impl/common_exceptions_impl.dart';

extension HttpResponseExtensions on http.Response {
  bool isSuccess() {
    return statusCode >= 200 && statusCode < 300;
  }

  bool isNotFound() {
    return statusCode == 404;
  }

  bool isServerError() {
    return statusCode >= 500 && statusCode < 600;
  }

  handleResponse<R>({R Function()? onSuccess}) {
    if (isSuccess()) {
      if (onSuccess != null) {
        return onSuccess();
      }
      return jsonDecode(body) as Map<String, dynamic>;
    } else if (isNotFound()) {
      throw NotFoundException();
    } else {
      throw ServerErrorException();
    }
  }
}
