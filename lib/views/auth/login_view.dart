import 'package:demoaipass/views/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_undraw/ms_undraw.dart';
import '../../core/app_constant.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UnDraw(
                  color: AppConstants.appColor,
                  illustration: UnDrawIllustration.building_a_website,
                  width: Get.width * 0.8,
                  height: Get.width * 0.8,
                ),
                Text(AppConstants.appName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "User")),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), hintText: "Password"), obscureText: true),
                const SizedBox(height: 20),
                // ปุ่มไล่สี (Gradient Button)
                GestureDetector(
                  onTap: () => {}, // เรียก AuthController.login ที่นี่
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [AppConstants.appColor, Colors.white, AppConstants.appColor]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(RegisterView()), 
                  child: const Text("สมัครสมาชิกใหม่"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}