abstract class IRestApiCrudService {
  // CREATE
  // Future<ResponseModel?> addData({
  Future<Map<String, dynamic>?> addData({
    String? accessToken,
    required String endPoint,
    required Map<String, dynamic> data,
  });

  // UPDATE
  Future<Map<String, dynamic>?> updateData({
    required Map<String, dynamic> data,
    String? accessToken,
    required String endPoint,
  });

  // DELETE
  Future<Map<String, dynamic>?> deleteData({
    required Map<String, dynamic> data,
    String? accessToken,
    required String endPoint,
  });

  // READ
  Future<Map<String, dynamic>?> getData({
    Map<String, dynamic>? data,
    String? accessToken,
    required String endPoint,
  });

  Future<List<Map<String, dynamic>>?> getAllDataList({
    String? accessToken,
    required String endPoint,
    Map<String, dynamic>? data,
  });
}
