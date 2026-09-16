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
      title: 'Minimalist App',
      theme: ThemeData(
        primarySwatch: Colors.green, // เลือกสีตามธีมที่คุณต้องการ
        useMaterial3: true,
      ),
      home: const LoginView(), // หน้าแรกคือ LoginView
      // หรือถ้าอยากใช้ named route สามารถใส่ getPages ได้ที่นี่
    );
  }
}