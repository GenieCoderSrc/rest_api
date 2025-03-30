import 'package:rest_api/exceptions/exceptions_impl/common_exceptions_impl.dart';

class HttpStatusCodeHandler {
  static Exception handle(int? statusCode) {
    switch (statusCode) {
      case 401:
        return UnauthorizedException();
      case 500:
        return ServerErrorException();
      default:
        return SomethingWentWrongException();
    }
  }
}
