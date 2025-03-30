class ServerException implements Exception {}

class CacheException implements Exception {}

//Exception classes
class UnauthorizedException implements Exception {
  String message = "Unauthorized";
}

class NotFoundException implements Exception {
  String message = "Not Found";
}

class ServerErrorException implements Exception {
  String message = "Server Error";
}

class SomethingWentWrongException implements Exception {
  String message = "Something Went Wrong";
}

class InvalidResponseDataException implements Exception {
  String message = "Invalid Response Data";
}

class NoInternetConnectionException implements Exception {
  String message = "No Internet Connection";
}

class BadResponseFormatException implements Exception {
  String message = "Bad Response Format";
}
