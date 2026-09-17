import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/api_client.dart';

// ใน lib/controllers/auth_controller.dart
class AuthController extends GetxController {
  final ApiClient _apiClient = ApiClient();
  final box = GetStorage();

  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    debugPrint('Attempting login with username: $username and password: $password');

    try {
      final response = await _apiClient.dio.post(
        'https://www.papayashotgo.com/noteToonProJ/apiUng/api/login.php',
        data: {'user': username, 'password': password},
      );

      if (response.data['success'] == true) {
        await box.write('token', response.data['access_token']);
        Get.offAllNamed('/home'); // ไปหน้าหลัก
      } else {
        Get.snackbar('Error', response.data['message'] ?? 'Login ไม่สำเร็จ');
      }
    } catch (e) {
      debugPrint('Login error: $e');
      Get.snackbar('Error', 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้');
    } finally {
      isLoading.value = false;
    }
  }
}
