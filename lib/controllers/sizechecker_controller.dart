import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizecheckerController extends GetxController {
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    final shouldBeMobile = constraints.maxWidth < 600;
    if (isMobile.value != shouldBeMobile) {
      isMobile.value = shouldBeMobile;
    }
  }
}
