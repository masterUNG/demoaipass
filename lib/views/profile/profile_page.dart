import 'package:demoaipass/controllers/profile_controller.dart';// import controller ที่สร้างข้างบน
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${controller.profileData['name'] ?? 'N/A'}'),
              Text('Role: ${controller.profileData['role'] ?? 'N/A'}'),
            ],
          ),
        );
      }),
    );
  }
}