class HttpResponseDataParser {
  static Object? dataToJson<T>(T? data) {
    if (T == bool) {
      return data;
    } else {
      return data as Map<String, dynamic>;
    }
  }

  static T? dataFromJson<T>(json) {
    if (T == bool) {
      return json as T?;
    } else {
      return json != null
          ? $tDataFromJson<T>(json as Map<String, dynamic>)
          : null;
    }
  }

  static T $tDataFromJson<T>(Map<String, dynamic> json) => json as T;
}
