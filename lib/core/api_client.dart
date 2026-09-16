import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.papayashotgo.com/noteToonProJ/apiUng',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  );

  ApiClient() {
    // Interceptor สำหรับแนบ Token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final box = GetStorage();
        final token = box.read('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  Dio get dio => _dio;
}