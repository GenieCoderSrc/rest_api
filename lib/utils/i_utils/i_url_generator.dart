import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';

abstract class IUrlGenerator {
  Uri generatePathUrl({
    required String endPoint,
    Map<String, dynamic>? keyParams,
    required IRestApiConfig config,
  });
}
