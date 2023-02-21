import 'package:dio/dio.dart';

Future<Dio> addInterceptors(Dio dio) async {
  dio.interceptors.add(
    QueuedInterceptorsWrapper(onRequest: (request, handler) async {
      handler.next(request);
    }),
  );
  return dio;
}