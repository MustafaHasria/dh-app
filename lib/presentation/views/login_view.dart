import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontFamily: 'AlexandriaFLF-Bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF3D004D),
        foregroundColor: Colors.white,
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 48),
                    
                    // App Icon
                    Icon(
                      Icons.person_outline,
                      size: 80,
                      color: Color(0xFF3D004D),
                    ),
                    SizedBox(height: 24),
                    
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontFamily: 'AlexandriaFLF-Bold',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D004D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    
                    Text(
                      'Sign in to your account',
                      style: TextStyle(
                        fontFamily: 'AlexandriaFLF',
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 48),
                    
                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    
                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    
                    // Login Button
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3D004D),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: TextStyle(
                            fontFamily: 'AlexandriaFLF-Bold',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login(_emailController.text, _passwordController.text);
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Register Link
                    TextButton(
                      onPressed: () => Get.toNamed('/register'),
                      child: Text(
                        'Don\'t have an account? Register',
                        style: TextStyle(
                          fontFamily: 'AlexandriaFLF',
                          color: Color(0xFF3D004D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
