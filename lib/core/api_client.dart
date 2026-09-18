import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';

class ApiClient {
  late Dio _dio;

  // สร้างตัวแปร instance

  static final ApiClient instance = ApiClient._internal();

  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.papayashotgo.com/noteToonProJ/apiUng/api/', // ปรับ BaseURL ตามที่เคยคุยกัน

        connectTimeout: const Duration(seconds: 10),

        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // ตรงนี้คุณอาจจะมี Interceptor ที่ใส่ Token อยู่แล้ว
  }

  Future<Response> getRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final token = GetStorage().read('token');

    return await dio.get(
      path,

      queryParameters: queryParameters,

      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        // Base URL ต้องไม่มี /api ต่อท้าย เพราะเราจะใช้ใน Controller
        baseUrl: 'https://www.papayashotgo.com/noteToonProJ/apiUng',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    );

    // จัดการเรื่อง SSL Certificate (ข้ามการตรวจสอบเพื่อความชัวร์)
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (
        X509Certificate cert,
        String host,
        int port,
      ) => true;
      return client;
    };

    // Interceptor สำหรับแนบ Token อัตโนมัติ
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = GetStorage().read('token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
