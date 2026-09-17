import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_undraw/ms_undraw.dart';
import '../../core/app_constant.dart';
import '../../controllers/auth_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Dependency Injection
    final AuthController authController = Get.find<AuthController>();
    
    // 2. Controllers & Keys
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final userController = TextEditingController();
    final passController = TextEditingController();
    final isPasswordVisible = false.obs;

    // 3. UI Helper Style
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  UnDraw(
                    color: AppConstants.appColor,
                    illustration: UnDrawIllustration.add_files,
                    width: Get.width * 0.6,
                    height: Get.width * 0.6,
                  ),
                  const Text("สมัครสมาชิก", 
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)
                  ),
                  const SizedBox(height: 30),
                  
                  // Name Field
                  TextFormField(
                    controller: nameController,
                    validator: (val) => val!.isEmpty ? "กรุณากรอกชื่อ-นามสกุล" : null,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.badge_outlined),
                      hintText: "ชื่อ-นามสกุล",
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Username Field
                  TextFormField(
                    controller: userController,
                    validator: (val) => val!.isEmpty ? "กรุณากรอก Username" : null,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      hintText: "Username",
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Password Field
                  Obx(() => TextFormField(
                    controller: passController,
                    obscureText: !isPasswordVisible.value,
                    validator: (val) => val!.length < 6 ? "รหัสผ่านต้อง 6 ตัวขึ้นไป" : null,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible.value ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => isPasswordVisible.toggle(),
                      ),
                      hintText: "Password",
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                    ),
                  )),
                  const SizedBox(height: 24),
                  
                  // Register Button
                  Obx(() => authController.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // เรียกใช้ method register ใน authController
                            // authController.register(
                            //   nameController.text, 
                            //   userController.text, 
                            //   passController.text
                            // );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]
                          ),
                          child: Center(
                            child: Text("สมัครสมาชิก", 
                              style: TextStyle(fontWeight: FontWeight.bold, color: AppConstants.appColor, fontSize: 16)
                            )
                          ),
                        ),
                      ),
                  ),
                  
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text("มีบัญชีอยู่แล้ว? เข้าสู่ระบบ", style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}