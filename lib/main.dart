import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/network/api_client.dart';
import 'core/storage/token_storage.dart';
import 'presentation/views/login_view.dart';
import 'presentation/views/register_view.dart';
import 'presentation/views/home_view.dart';
import 'presentation/views/update_information_view.dart';
import 'presentation/views/change_password_view.dart';
import 'presentation/views/delete_account_view.dart';
import 'presentation/bindings/auth_binding.dart';
import 'presentation/bindings/user_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
  // Initialize shared dependencies
  _initializeSharedDependencies();

  // Check token before running the app
  final box = GetStorage();
  final token = box.read('token');
  final expiry = box.read('token_expiry');
  bool isValid = false;
  if (token != null && expiry != null) {
    final expiryDate = DateTime.tryParse(expiry);
    if (expiryDate != null && DateTime.now().isBefore(expiryDate)) {
      isValid = true;
    }
  }

  runApp(MyApp(initialRoute: isValid ? '/home' : '/login'));
}

void _initializeSharedDependencies() {
  // Initialize core dependencies that are shared across all bindings
  Get.put(ApiClient('http://testapi.alifouad91.com/api'), permanent: true);
  Get.put(TokenStorage(), permanent: true);
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TDH App',
      theme: ThemeData(
        fontFamily: 'AlexandriaFLF',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3D004D)),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
          binding: UserBinding(),
        ),
        GetPage(
          name: '/update-information',
          page: () => UpdateInformationView(),
          binding: UserBinding(),
        ),
        GetPage(
          name: '/change-password',
          page: () => ChangePasswordView(),
          binding: UserBinding(),
        ),
        GetPage(
          name: '/delete-account',
          page: () => DeleteAccountView(),
          binding: UserBinding(),
        ),
      ],
    );
  }
}
