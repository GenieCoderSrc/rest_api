import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';

class RestApiConfigAppDevModeImpl extends IRestApiConfig {
  static const String BASE_URL =
      "https://hubstafferapi20210211223323.azurewebsites.net";
  static const String API_KEY = '';

  @override
  String get apiKey => API_KEY;

  @override
  String get baseUrl => BASE_URL;
}
