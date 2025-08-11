import 'package:dio/dio.dart';

Dio configureDio() {
  final options = BaseOptions(
    baseUrl: 'https://api.coinlore.net/api',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 60),
    headers: {'Content-Type': 'application/json'},
  );

  final dio = Dio(options);

  return dio;
}
