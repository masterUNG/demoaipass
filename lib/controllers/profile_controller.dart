import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var profileData = {}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      isLoading(true);
      final storage = GetStorage();
      String? token = storage.read('token');

      Dio dio = Dio();
      final response = await dio.get(
        'https://www.papayashotgo.com/noteToonProJ/apiUng/api/profile.php',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        profileData.value = response.data['data'];
      }
    } catch (e) {
      Get.snackbar("Error", "ไม่สามารถดึงข้อมูลโปรไฟล์ได้");
    } finally {
      isLoading(false);
    }
  }
}