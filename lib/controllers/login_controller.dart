import 'package:flutter/material.dart';
import 'package:flutter_kelompok/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Rx variables
  var loginStatus = ''.obs;

  // Data stuffs
  final String validUsername = "Gerrard";
  final String validPassword = "Galih";

  // Most of this should be self explanitory

  void login() async {
    if (usernameController.text.toString() == validUsername &&
        passwordController.text.toString() == validPassword) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar(
        "Errorrr hauahwuahdskajas ",
        "Incorrect Username or PAssword ",
      );
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.splashscreen);
  }
}