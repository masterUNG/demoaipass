# App Attendance & News (Minimalist UI)

แอปพลิเคชันสำหรับลงเวลาทำงานและติดตามข่าวสารภายในองค์กร ด้วยดีไซน์มินิมอล

## Tech Stack
- **Flutter**: UI Framework
- **GetX**: State Management, Dependency Injection & Routing
- **Dio**: HTTP Client (with SSL bypass)
- **GetStorage**: Local Token Storage
- **ms_undraw**: Illustrations

## Project Structure
```text
lib/
├── controllers/       # จัดการ Logic ของแอปทั้งหมด
│   └── auth_controller.dart
├── core/              # ค่าคงที่และการตั้งค่าพื้นฐาน
│   ├── api_client.dart
│   └── app_constant.dart
├── data/              # Data Models
│   └── models/
│       └── user_model.dart
├── views/             # หน้าจอ UI แบ่งตามหมวดหมู่
│   ├── auth/          # หน้า Login และ Register
│   │   ├── login_view.dart
│   │   └── register_view.dart
│   └── home/          # หน้าหลัก
│       └── main_home.dart
└── main.dart          # จุดเริ่มต้นและกำหนด Routing
```

## API Integration
- **Base URL**: `https://www.papayashotgo.com/noteToonProJ/apiUng`
- **Auth**: ใช้ JWT Bearer Token ในการเข้าถึง API หลัง Login
- **Error Handling**: จัดการผ่าน Interceptor และแสดงผลด้วย `Get.snackbar`

## How to Run
1. ติดตั้ง Dependencies: `flutter pub get`
2. ตรวจสอบ `main.dart` ให้เรียก `WidgetsFlutterBinding.ensureInitialized()` และ `GetStorage.init()`
3. รันแอป: `flutter run`

## Development Notes
- **Login**: ใช้ `POST /api/login.php` (ผ่านการ Hardcode Full Path เพื่อป้องกันปัญหา 404)
- **Security**: มีการ bypass Certificate เพื่อรองรับการเชื่อมต่อกับ Server ที่มีปัญหา SSL
- **UI**: ใช้การไล่สี Gradient จาก `AppConstants.appColor` ลงมาหา `Colors.white`