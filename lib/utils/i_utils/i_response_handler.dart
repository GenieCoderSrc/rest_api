abstract class IResponseHandler<TResponse> {
  Map<String, dynamic>? handleResponse(response);
}
