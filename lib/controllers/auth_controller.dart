import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../core/api_client.dart';
import '../data/models/user_model.dart';

class AuthController extends GetxController {
  final ApiClient _apiClient = ApiClient();
  final box = GetStorage();
  
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  // ฟังก์ชัน Login
  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await _apiClient.dio.post('/login.php', data: {
        'user': username,
        'password': password,
      });

      if (response.data['success'] == true) {
        // เก็บ Token
        await box.write('token', response.data['access_token']);
        // เก็บข้อมูล User
        user.value = UserModel.fromJson(response.data['user']);
        
        Get.offAllNamed('/home'); // ไปหน้า Home
        Get.snackbar('Success', 'Login เรียบร้อย');
      }
    } catch (e) {
      Get.snackbar('Error', 'Login ไม่สำเร็จ กรุณาตรวจสอบข้อมูล');
    } finally {
      isLoading.value = false;
    }
  }

  // ฟังก์ชัน Register
  Future<void> register(String name, String username, String password) async {
    isLoading.value = true;
    try {
      final response = await _apiClient.dio.post('/register.php', data: {
        'name': name,
        'user': username,
        'password': password,
      });

      if (response.data['success'] == true) {
        Get.back(); // กลับไปหน้า Login
        Get.snackbar('Success', 'สมัครสมาชิกสำเร็จ กรุณา Login');
      }
    } catch (e) {
      Get.snackbar('Error', 'ไม่สามารถสมัครสมาชิกได้');
    } finally {
      isLoading.value = false;
    }
  }
}