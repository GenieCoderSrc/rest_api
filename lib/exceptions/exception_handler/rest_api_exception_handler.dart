import 'dart:io';

import 'package:rest_api/exceptions/exceptions_impl/common_exceptions_impl.dart';

class RestApiExceptionHandler {
  static Exception handleException(Object e) {
    if (e is SocketException) {
      throw NoInternetConnectionException();
    } else if (e is FormatException) {
      throw BadResponseFormatException();
    } else if (e is HttpException) {
      throw HttpException(e.message);
    } else {
      throw SomethingWentWrongException();
    }
  }
}
