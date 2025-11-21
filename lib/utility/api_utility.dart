import 'package:dio/dio.dart' as dio_link;

import '../services/api_config.dart';

class APIProvider {
  static dio_link.Dio? dio = dio_link.Dio(options);

  static dio_link.BaseOptions? options = dio_link.BaseOptions(
      baseUrl: 'https://Khatiwansh.org/api/',
      connectTimeout: Duration(milliseconds: 30000),
      receiveTimeout: Duration(milliseconds: 30000),
      validateStatus: (code) {
        if (code! >= 200) {
          return true;
        }
        return false;
      });

  // options!.headers["content-type"] = "application/json";
  static dio_link.Dio getDio() {
    return dio!;
  }
}
