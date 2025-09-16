import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_ButtonNew.dart';
import 'package:flutter_kelompok/componenets/widget_textfieldNew.dart';
import 'package:flutter_kelompok/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Awesome image
            Center(
              child: Image.asset('assets/Slime.png', width: 100, height: 150),
            ),
            
            CustomTextField(textEditingController: loginController.usernameController, label: "Username"),

            const SizedBox(height: 20),

            CustomTextField(textEditingController: loginController.passwordController, label: "Password", isObscured: true),

            const SizedBox(height: 20),

            CustomButton(
              text: "Login",
              textcolor: Colors.black,
              onPressed: loginController.login,
              bgcolor: Colors.blue,
              cancustomwidth: true,
              customwidth: 300,
            ),

            const SizedBox(height: 20),

            // Login message
            Obx(
              () => Text(
                loginController.loginStatus.value,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
