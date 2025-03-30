abstract class IHttpMethod {
  Future<Map<String, dynamic>> execute(
    Uri url,
    Map<String, String> headers,
    Map<String, dynamic>? data,
  );
}
