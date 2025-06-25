import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'update_information_model.dart';
import 'update_information_provider.dart';

class UpdateInformationController extends GetxController {
  final UpdateInformationProvider provider = UpdateInformationProvider();
  final formKey = GlobalKey<FormState>();

  var model = UpdateInformationModel(name: '', email: '', phone: '', countryCode: '').obs;
  var isLoading = false.obs;

  final GetStorage _storage = GetStorage();

  int? get userId => _storage.read('userId');

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    if (userId == null) return;
    isLoading.value = true;
    final user = await provider.getUser(userId!);
    if (user != null) {
      model.value = user;
    }
    isLoading.value = false;
  }

  void updateName(String value) => model.update((val) {
        val?.name = value;
      });

  void updatePhone(String value) => model.update((val) {
        val?.phone = value;
      });

  void updateEmail(String value) => model.update((val) {
        val?.email = value;
      });

  void updateCountryCode(String value) => model.update((val) {
        val?.countryCode = value;
      });

  void save() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;
    final success = await provider.updateUser(model.value);
    isLoading.value = false;
    if (success) {
      Get.snackbar('Success', 'Your information is updated successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
      fetchUser();
    } else {
      Get.snackbar('Error', 'Failed to update information', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
