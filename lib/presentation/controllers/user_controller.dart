import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_user_usecase.dart';
import '../../domain/usecases/update_user_usecase.dart';
import '../../domain/usecases/change_password_usecase.dart';
import '../../domain/usecases/delete_user_usecase.dart';
import '../../core/storage/token_storage.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController {
  final GetUserUseCase getUserUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  final TokenStorage tokenStorage;

  UserController(
    this.getUserUseCase,
    this.updateUserUseCase,
    this.changePasswordUseCase,
    this.deleteUserUseCase,
    this.tokenStorage,
  );

  var user = Rxn<UserEntity>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final userId = tokenStorage.getUserId();
    if (userId == null) return;
    isLoading.value = true;
    user.value = await getUserUseCase(userId);
    isLoading.value = false;
  }

  Future<void> updateUser(UserEntity updatedUser) async {
    isLoading.value = true;
    final success = await updateUserUseCase(updatedUser);
    isLoading.value = false;
    if (success) {
      Get.snackbar(
        'Success',
        'Your information is updated successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      user.value = updatedUser;
    } else {
      Get.snackbar('Error', 'Failed to update information');
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    isLoading.value = true;
    final success = await changePasswordUseCase(oldPassword, newPassword);
    isLoading.value = false;
    if (success) {
      Get.snackbar('Success', 'Password changed successfully');
    } else {
      Get.snackbar('Error', 'Failed to change password');
    }
  }

  Future<void> deleteUser() async {
    isLoading.value = true;
    final success = await deleteUserUseCase();
    isLoading.value = false;
    if (success) {
      Get.snackbar('Success', 'Account deleted successfully');
      // Optionally, clear token and userId
      tokenStorage.saveToken('');
      tokenStorage.saveUserId(0);
      Get.offAllNamed('/login');
    } else {
      Get.snackbar('Error', 'Failed to delete account');
    }
  }
}
