import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio_package;

import '../core/api_client.dart';

// ใน lib/controllers/auth_controller.dart
class AuthController extends GetxController {
  final ApiClient _apiClient = ApiClient();
  final box = GetStorage();

  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    debugPrint(
      'Attempting login with username: $username and password: $password',
    );

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

  // ใน lib/controllers/auth_controller.dart

  Future<void> register(String name, String user, String password) async {
    isLoading.value = true;

    try {
      // กำหนด URL ของ API
      const String url =
          'https://www.papayashotgo.com/noteToonProJ/apiUng/api/register.php';

      // เตรียมข้อมูลที่จะส่ง (Payload)
      final Map<String, dynamic> data = {
        "name": name,
        "user": user,
        "password": password,
      };

      // ส่ง request ผ่าน Dio (สมมติว่าคุณตั้งค่า Dio ไว้ใน api_client.dart แล้ว)
      // หรือถ้าใช้ instance ทั่วไป:
      final response = await dio_package.Dio().post(
        url,
        data: data,
        options: dio_package.Options(
          headers: {'Content-Type': 'application/json', 'accept': '*/*'},
        ),
      );

      // ตรวจสอบผลลัพธ์
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back(); // ปิดหน้า Register หลังจากสมัครสำเร็จ
        Get.snackbar(
          "สำเร็จ",
          "สมัครสมาชิกเรียบร้อยแล้ว",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        throw Exception('สมัครสมาชิกไม่สำเร็จ');
      }
    } catch (e) {
      Get.snackbar(
        "เกิดข้อผิดพลาด",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
