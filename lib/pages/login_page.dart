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
      backgroundColor: Colors.blue[300],
      body: Center(
        child: SizedBox(
          width: 450,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title with icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check_circle_outline,
                          color: Colors.blue, size: 32),
                      SizedBox(width: 10),
                      Text(
                        "To-Do List",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Username field
                  CustomTextField(
                    textEditingController: loginController.usernameController,
                    label: "Username",
                  ),

                  const SizedBox(height: 20),

                  // Password field
                  CustomTextField(
                    textEditingController: loginController.passwordController,
                    label: "Password",
                    isObscured: true,
                  ),

                  const SizedBox(height: 30),

                  // Login button
                  CustomButton(
                    text: "Login",
                    textcolor: Colors.white,
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
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
