import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'update_information_controller.dart';

class UpdateInformationView extends GetView<UpdateInformationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Information', style: TextStyle(fontFamily: 'AlexandriaFLF', fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF3D004D),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      initialValue: controller.model.value.name,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(fontFamily: 'AlexandriaFLF'),
                      onChanged: controller.updateName,
                      validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      initialValue: controller.model.value.phone,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset('assets/uae_flag.png', width: 24),
                        ),
                        labelText: 'Phone',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontFamily: 'AlexandriaFLF'),
                      onChanged: controller.updatePhone,
                      validator: (v) => v == null || v.isEmpty ? 'Enter your phone' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      initialValue: controller.model.value.email,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontFamily: 'AlexandriaFLF'),
                      onChanged: controller.updateEmail,
                      validator: (v) => v == null || !GetUtils.isEmail(v) ? 'Enter a valid email' : null,
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3D004D),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontFamily: 'AlexandriaFLF', fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: controller.save,
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
} 