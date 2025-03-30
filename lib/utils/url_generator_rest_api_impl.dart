import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';
import 'package:rest_api/utils/i_utils/i_url_generator.dart';

class UrlGeneratorRestApiImpl extends IUrlGenerator {
  @override
  Uri generatePathUrl(
      {required String endPoint,
      Map<String, dynamic>? keyParams,
      required IRestApiConfig config}) {
    // if there have a api key,
    String paramsString = '';
    if (keyParams?.isNotEmpty ?? false) {
      keyParams?.forEach((key, value) {
        paramsString += '&$key=$value';
      });

      return Uri.parse(
          '${config.baseUrl}/$endPoint?api_key=${config.apiKey}$paramsString');
    }

    return Uri.parse('${config.baseUrl}/$endPoint');
  }
}
