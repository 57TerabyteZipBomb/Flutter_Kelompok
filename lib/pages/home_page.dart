import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/sizechecker_controller.dart';
import 'package:flutter_kelompok/pages/Mobile/Mobile_Home_page.dart';
import 'package:flutter_kelompok/pages/Widescreen/widescreen_home_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<SizecheckerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          //width size detection
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.updateLayout(constraints);
          });
          return Obx(
            () => controller.isMobile.value
                ? MobileHomePage()
                : WidescreenHomePage(),
          );
        },
      ),
    );
  }
}
