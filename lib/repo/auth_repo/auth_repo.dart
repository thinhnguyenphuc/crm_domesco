import 'package:demo_domesco/services/dio/dio_client.dart';
import 'package:demo_domesco/services/local/auth_hive.dart';

class AuthRepo {
  static Future<bool> login(String username, String hashedPassword) async {
    Map<String, String> data = {"login": username, "password": hashedPassword};
    Map<dynamic, dynamic>? res = await DioClient.post("signIn", data);
    if (res != null) {
      AuthHive.saveToken(res["token"]);
      return true;
    }
    return false;
  }
}
