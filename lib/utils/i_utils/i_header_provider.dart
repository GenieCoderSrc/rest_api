// Interface Segregation Principle (ISP)
abstract class IHeaderProvider {
  Map<String, String> getHeaders(String? accessToken);
}
