import 'package:demo_domesco/services/local/auth_hive.dart';
import 'package:dio/dio.dart';

Future<Dio> addInterceptors(Dio dio) async {
  String token = await AuthHive.getToken();
  dio.interceptors.add(
    QueuedInterceptorsWrapper(onRequest: (request, handler) async {
      request.headers.addAll({"Authorization": "Bearer $token"});
      handler.next(request);
    }),
  );
  return dio;
}
