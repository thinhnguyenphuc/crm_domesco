import 'package:demo_domesco/resources/config.dart';
import 'package:demo_domesco/services/dio/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static Dio? _client;

  static Future<Dio> _getClient() async {
    if (_client == null) {
      _client = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ));
      return await addInterceptors(_client!);
    } else {
      return _client!;
    }
  }

  static Future<Map<dynamic, dynamic>?> post(String subDomain, Map<String, String> data) async {
    try {
      Response response = await (await _getClient()).post(
          "${Config.serverName}/$subDomain/",
          data: data,
          options: Options(contentType: "application/json"));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<void> get(String subDomain) async {
    try {
      var tmp = await (await _getClient()).get(
          "${Config.serverName}/$subDomain/",
          options: Options(contentType: "application/json"));
      print(tmp);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
