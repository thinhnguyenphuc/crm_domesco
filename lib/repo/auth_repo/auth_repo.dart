import 'package:demo_domesco/services/dio/dio_client.dart';

class AuthRepo {
  static Future<bool> login(String username, String hashedPassword) async{
    Map<String, String> data = {"login": username, "password": hashedPassword};
    Map<dynamic, dynamic>? res = await DioClient.post("signIn", data);
    if(res != null){
      return true;
    }
    return false;
  }
}