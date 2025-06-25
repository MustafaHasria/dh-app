import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../core/storage/token_storage.dart';
import '../../data/models/user_model.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final TokenStorage tokenStorage;

  AuthController(this.loginUseCase, this.registerUseCase, this.tokenStorage);

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await loginUseCase(email, password);
      if (response != null) {
        // Parse the response as JSON and extract the data
        final data = LoginResponseModel.fromJson(response['data']);
        tokenStorage.saveToken(data.token);
        tokenStorage.saveTokenExpiry(data.tokenExpiry);
        tokenStorage.saveUserId(data.id);
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Login failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString().replaceFirst('Exception: ', ''));
    } finally {
      isLoading.value = false;
    }
  }

  static void checkAutoLogin() {
    final authController = Get.find<AuthController>();
    if (authController.tokenStorage.getToken() != null && authController.tokenStorage.isTokenValid()) {
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/welcome');
    }
  }

  Future<void> register(UserEntity user, String password, String passwordConfirm) async {
    isLoading.value = true;
    try {
      final success = await registerUseCase(user, password, passwordConfirm);
      if (success) {
        Get.snackbar('Success', 'Registration successful');
        Get.offAllNamed('/login');
      } else {
        Get.snackbar('Error', 'Registration failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString().replaceFirst('Exception: ', ''));
    } finally {
      isLoading.value = false;
    }
  }
}
