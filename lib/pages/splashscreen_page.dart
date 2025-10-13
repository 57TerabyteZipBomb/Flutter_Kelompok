import 'package:flutter/material.dart';

import 'package:flutter_kelompok/controllers/sizechecker_controller.dart';
import 'package:flutter_kelompok/pages/Mobile/mobile_splashscreen_page.dart';
import 'package:flutter_kelompok/pages/Widescreen/widescreen_splashscreen_page.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SizecheckerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? MobileSplashscreenPage()
                : WidescreenSplashscreenPage(),
          );
        },
      ),
    );
  }
}
