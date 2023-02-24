import 'dart:convert';

import 'package:demo_domesco/resources/config.dart';
import 'package:demo_domesco/services/dio/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
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

  static Future<Map<dynamic, dynamic>?> post(
      String subDomain, Map<String, String> data) async {
    try {
      Response response = await Dio().post("${Config.serverName}/$subDomain/",
          data: data, options: Options(contentType: "application/json"));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<List<dynamic>?> get(String subDomain,
      {Map<String, String>? queryData}) async {
    String queryDataEncrypt = "";
    if (queryData != null) {
      queryDataEncrypt = Uri.encodeComponent(encryptMap(queryData));

    }
    try {
      String serverDomain = "${Config.serverName}/$subDomain/$queryDataEncrypt";
      var response = await (await _getClient())
          .get(serverDomain, options: Options(contentType: "application/json"));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static String encryptMap(Map<String, String> map) {
    final secretKey = Uint8List.fromList(utf8.encode("0123456789012345"));
    final initVector = Uint8List.fromList(utf8.encode("0123456789012345"));
    final iv = encrypt.IV(initVector);
    final key = encrypt.Key(secretKey);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.ecb));
    final json = jsonEncode(map);
    final encrypted = encrypter.encrypt(json, iv: iv);
    return encrypted.base64;
  }
}
