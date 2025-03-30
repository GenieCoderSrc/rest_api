// Dependency Inversion Principle (DIP)
abstract class IRestApiConfig {
  String get baseUrl;
  String get apiKey;
}
