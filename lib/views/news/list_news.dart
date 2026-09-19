import 'package:demoaipass/controllers/news_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../controllers/news_controller.dart'; // ปรับ Path ให้ตรงกับที่คุณเก็บไฟล์

class ListNews extends StatelessWidget {
  const ListNews({super.key});

  @override
  Widget build(BuildContext context) {
    // กำหนด Controller
    final NewsController controller = Get.put(NewsController());

    return Scaffold(
      // appBar: AppBar(title: const Text('News List123')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return ListView.builder(
          itemCount: controller.newsList.length,
          itemBuilder: (context, index) {
            final news = controller.newsList[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // แสดงรูปภาพ กว้าง 80% ของจอ
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Image.memory(
                      controller.getImageBytes(news.imageBase64 ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(news.title ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(news.subtitle ?? ""),
                        const SizedBox(height: 5),
                        Text(news.detail ?? "", maxLines: 2, overflow: TextOverflow.ellipsis),
                        const Divider(),
                        Text("By: ${news.creatorName} | ${news.createdAt}", 
                             style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}