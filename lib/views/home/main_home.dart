import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demoaipass/controllers/home_controller.dart'; // ปรับ Path ตามโครงสร้างจริง
import 'package:demoaipass/views/news/list_news.dart';
import 'package:demoaipass/views/profile/profile_page.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});

  // Inject HomeController
  final HomeController controller = Get.put(HomeController());

  // รายการหน้าจอที่จะแสดง
  final List<Widget> pages = [const ListNews(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Home')),
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'News'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
