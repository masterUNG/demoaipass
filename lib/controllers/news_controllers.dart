import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/models/news_model.dart';
import '../core/api_client.dart'; // สมมติ path นี้

class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

    void fetchNews() async {
    try {
      isLoading(true);
      
      // เรียกผ่าน instance ที่สร้างไว้
      final response = await ApiClient.instance.getRequest(
        'news.php', 
        queryParameters: {'page': 1, 'limit': 10, 'include_image': 1}
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        var data = response.data['data'] as List;
        newsList.value = data.map((e) => NewsModel.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  // ฟังก์ชันช่วยตัด Header Base64
  Uint8List getImageBytes(String base64String) {
    String pureBase64 = base64String.split(',').last;
    return base64Decode(pureBase64);
  }
}