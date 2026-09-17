import 'package:demoaipass/core/app_constant.dart';
import 'package:demoaipass/views/auth/register_view.dart';
import 'package:demoaipass/views/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'views/auth/login_view.dart'; // ตรวจสอบ Path ให้ตรงกับที่คุณสร้างไว้

void main() async {
  // 1. รอให้ Flutter engine ทำงานก่อนเรียกใช้ GetStorage
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize GetStorage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. ใช้ GetMaterialApp เพื่อให้ GetX ทำงานได้เต็มที่ (Route, Snackbar, etc.)
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.appColor),
        useMaterial3: true,
      ),
      initialRoute: '/', // หน้าแรก
      getPages: [
        GetPage(name: '/', page: () => const LoginView()),
        GetPage(name: '/register', page: () => const RegisterView()),
        GetPage(name: '/home', page: () => const MainHome()),
      ],
    );
  }
}
