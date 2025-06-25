import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'AlexandriaFLF-Bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF3D004D),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        final user = controller.user.value;
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (user == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_off, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No user data available',
                  style: TextStyle(
                    fontFamily: 'AlexandriaFLF',
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // User Profile Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Profile Avatar
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xFF3D004D),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      // User Name
                      Text(
                        user.name,
                        style: TextStyle(
                          fontFamily: 'AlexandriaFLF-Bold',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D004D),
                        ),
                      ),
                      SizedBox(height: 24),
                      
                      // User Details
                      _buildInfoRow(Icons.email, 'Email', user.email),
                      SizedBox(height: 12),
                      _buildInfoRow(Icons.phone, 'Phone', '${user.countryCode} ${user.phone}'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              
              // Action Buttons
              _buildActionButton(
                'Update Information',
                Icons.edit,
                () => Get.toNamed('/update-information'),
              ),
              SizedBox(height: 16),
              
              _buildActionButton(
                'Change Password',
                Icons.lock,
                () => Get.toNamed('/change-password'),
              ),
              SizedBox(height: 16),
              
              _buildActionButton(
                'Delete Account',
                Icons.delete_forever,
                () => Get.toNamed('/delete-account'),
                isDestructive: true,
              ),
              SizedBox(height: 16),
              
              _buildActionButton(
                'Logout',
                Icons.logout,
                () {
                  controller.tokenStorage.saveToken('');
                  controller.tokenStorage.saveUserId(0);
                  controller.tokenStorage.saveTokenExpiry('');
                  Get.offAllNamed('/login');
                },
                isDestructive: true,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF3D004D), size: 20),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'AlexandriaFLF',
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'AlexandriaFLF',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon, VoidCallback onPressed, {bool isDestructive = false}) {
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDestructive ? Colors.red : Color(0xFF3D004D),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(
            fontFamily: 'AlexandriaFLF-Bold',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(title),
      ),
    );
  }
}
