import 'package:rest_api/utils/i_utils/i_header_provider.dart';

class HeaderProviderBearerImpl extends IHeaderProvider {
  @override
  Map<String, String> getHeaders(String? accessToken) {
    return <String, String>{
      'Content-Type': 'application/json',
      if (accessToken != null) 'Authorization': 'Bearer $accessToken'
    };
  }
}
