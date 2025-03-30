import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/exceptions/exception_handler/rest_api_exception_handler.dart';
import 'package:rest_api/extenstions/http_response_extensions.dart';
import 'package:rest_api/utils/i_utils/i_header_provider.dart';
import 'package:rest_api/utils/i_utils/i_response_handler.dart';
import 'package:rest_api/utils/i_utils/i_rest_api_config.dart';
import 'package:rest_api/utils/i_utils/i_url_generator.dart';

import 'i_data_sources/i_image_service_rest_api_data_source.dart';

class ImageServiceRestApiDataSourceHttpImpl
    extends IImageServiceRestApiDataSource {
  final IResponseHandler<http.Response> iResponseHandler;
  final IHeaderProvider iRestApiHeaderProvider;
  final IUrlGenerator iApiPathUrlGenerator;
  final IRestApiConfig iRestApiConfig;

  ImageServiceRestApiDataSourceHttpImpl({
    required this.iRestApiConfig,
    required this.iResponseHandler,
    required this.iRestApiHeaderProvider,
    required this.iApiPathUrlGenerator,
  });

  @override
  Future<bool> deleteFile(
      {required String endPoint, String? accessToken}) async {
    try {
      // get url
      Uri uri = iApiPathUrlGenerator.generatePathUrl(
          endPoint: endPoint, config: iRestApiConfig);

      // get headers
      Map<String, String> headers =
          iRestApiHeaderProvider.getHeaders(accessToken);

      final http.Response response = await http.delete(uri, headers: headers);

      debugPrint(
          'ImageServiceRestApiDataSourceHttpImpl | deleteFile | response body: ${response.body.toString()}');

      // handle Response data &  exceptions
      return response.handleResponse<bool>(onSuccess: () => true);
    } catch (e) {
      debugPrint(
          'ImageServiceRestApiDataSourceHttpImpl | deleteFile | error: $e');
      throw RestApiExceptionHandler.handleException(e);
    }
  }

  @override
  Future<String?> uploadFile({
    required File file,
    required String endPoint,
    Map<String, dynamic>? queryParams,
    String? fileName,
    String imgFieldName = 'image',
    String? accessToken,
    String urlFieldName = 'url',
  }) async {
    try {
      // get url
      Uri uri = iApiPathUrlGenerator.generatePathUrl(
          endPoint: endPoint, config: iRestApiConfig);

      // Create a multipart request
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);

      // get headers
      Map<String, String> headers =
          iRestApiHeaderProvider.getHeaders(accessToken);
      request.headers.addAll(headers);

      // Attach the image file to the request
      final http.ByteStream fileStream = http.ByteStream(file.openRead());
      final int length = await file.length();
      final http.MultipartFile multipartFile = http.MultipartFile(
          imgFieldName, fileStream, length,
          filename: fileName ?? file.path);
      request.files.add(multipartFile);

      // Add query parameters if provided
      if (queryParams != null) {
        queryParams.forEach((key, value) {
          request.fields[key] = Uri.encodeQueryComponent(value.toString());
        });
      }

      // Send the request
      final http.StreamedResponse streamedResponse = await request.send();
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

      // handle Response data &  exceptions
      return iResponseHandler.handleResponse(response)?['data'][urlFieldName]
          as String;
    } catch (e) {
      debugPrint(
          'ImageServiceRestApiDataSourceHttpImpl | uploadFile | error: $e');
      throw RestApiExceptionHandler.handleException(e);
    }
  }
}
