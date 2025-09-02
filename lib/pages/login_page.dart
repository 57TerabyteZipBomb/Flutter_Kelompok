import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Username
            TextField(
              controller: loginController.usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Password
            // Wrapped in an Obx since it has show/hide functionality
            Obx(() => TextField(
                  controller: loginController.passwordController,
                  obscureText: loginController.isPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginController.isPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: loginController.togglePasswordVisibility,
                    ),
                  ),
                )),
            const SizedBox(height: 20),

            // Login button
            ElevatedButton(
              onPressed: loginController.login,
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),

            // Login message
            Obx(() => Text(
                  loginController.loginStatus.value,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}