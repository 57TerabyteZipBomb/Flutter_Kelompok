import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Rx variables
  var isPasswordHidden = true.obs;
  var loginStatus = ''.obs;

  // Data stuffs
  final String validUsername = "Gerrard";
  final String validPassword = "Galih";

  // Most of this should be self explanitory
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() {
    final user = usernameController.text.trim();
    final pass = passwordController.text.trim();

    if (user == validUsername && pass == validPassword) {
      loginStatus.value = "good jop";
      //add page change here probably
    } else {
      loginStatus.value = "die";
    }
  }
}