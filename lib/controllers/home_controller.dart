import 'package:get/get.dart';

class HomeController extends GetxController {
  // ตัวแปรเก็บตำแหน่งปัจจุบันของ Tab
  var currentIndex = 0.obs;

  // ฟังก์ชันเปลี่ยน Tab
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}