import 'package:rest_api/config/di/rest_api_service_get_it_register.dart';
import 'package:rest_api/data/data_sources/i_data_sources/i_image_service_rest_api_data_source.dart';
import 'package:rest_api/rest_api.dart';
import 'package:get_it/get_it.dart';
import 'dart:io';

final sl = GetIt.instance;

void main() async {
  // Register services
  restApiServiceGetItRegister();

  final restApiService = sl<IRestApiCrudService>();
  final imageService = sl<IImageServiceRestApiDataSource>();

  // Example: Create User
  final response = await restApiService.addData(
    endPoint: 'user/create',
    data: {'name': 'Alice', 'email': 'alice@example.com'},
  );
  print('Create User Response: $response');

  // Example: Get User Data
  final userData = await restApiService.getData(endPoint: 'user/1');
  print('User Data: $userData');

  // Example: Upload File
  final file = File('path/to/image.png');
  final uploadResponse = await imageService.uploadFile(
    file: file,
    endPoint: 'upload/image',
  );
  print('Upload Response: $uploadResponse');
}
