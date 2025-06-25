import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class ChangePasswordView extends StatelessWidget {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Color(0xFF3D004D),
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _oldPasswordController,
                    decoration: InputDecoration(labelText: 'Old Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: InputDecoration(labelText: 'New Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Confirm New Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_newPasswordController.text == _confirmPasswordController.text) {
                        controller.changePassword(_oldPasswordController.text, _newPasswordController.text);
                      } else {
                        Get.snackbar('Error', 'Passwords do not match');
                      }
                    },
                    child: Text('Change Password'),
                  ),
                ],
              ),
            )),
    );
  }
}
