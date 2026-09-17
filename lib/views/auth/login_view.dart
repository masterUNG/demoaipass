import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_undraw/ms_undraw.dart';
import '../../core/app_constant.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // ใช้ RxBool คุมการแสดง Password
    final isPasswordVisible = false.obs;

    // สไตล์ Outline ที่โค้งไม่มาก
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppConstants.appColor.withOpacity(0.5)),
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppConstants.appColor, Colors.white],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UnDraw(
                  color: AppConstants.appColor,
                  illustration: UnDrawIllustration.building_a_website,
                  width: Get.width * 0.8,
                  height: Get.width * 0.8,
                ),
                Text(AppConstants.appName, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    hintText: "Username",
                    border: inputBorder,
                    enabledBorder: inputBorder,
                  ),
                ),
                const SizedBox(height: 16),
                // Password พร้อม Obx
                Obx(() => TextFormField(
                  obscureText: !isPasswordVisible.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible.value ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => isPasswordVisible.toggle(),
                    ),
                    hintText: "Password",
                    border: inputBorder,
                    enabledBorder: inputBorder,
                  ),
                )),
                const SizedBox(height: 24),
                // ปุ่ม
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [AppConstants.appColor, Colors.white, AppConstants.appColor]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, color: AppConstants.appColor))),
                ),
                TextButton(
                  onPressed: () => Get.toNamed('/register'),
                  child: const Text("สมัครสมาชิกใหม่", style: TextStyle(color: Colors.black54)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}