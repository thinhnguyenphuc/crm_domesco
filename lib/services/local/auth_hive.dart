import 'package:hive_flutter/hive_flutter.dart';

class AuthHive {
  static Box? _authBox;

  static Future<Box> _getAuthBox() async {
    return _authBox ??= await Hive.openBox("AuthBox");
  }

  static Future<void> saveToken(String token) async {
    await _getAuthBox().then((value) => value.put("token", token));
  }

  static Future<String> getToken() async {
    return _getAuthBox().then((value) => value.get("token", defaultValue: ""));
  }
}
