import 'package:rest_api/exceptions/exceptions_impl/common_exceptions_impl.dart';

extension HttpStatusExtensions on int? {
  Exception handleException() {
    switch (this) {
      case 401:
        return UnauthorizedException();
      case 404:
        return NotFoundException();
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        return ServerErrorException();
      default:
        return SomethingWentWrongException();
    }
  }
}
