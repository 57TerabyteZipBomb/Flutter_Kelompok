import 'package:flutter/material.dart';

import 'package:flutter_kelompok/controllers/sizechecker_controller.dart';
import 'package:flutter_kelompok/pages/Mobile/mobile_profile_page.dart';
import 'package:flutter_kelompok/pages/Widescreen/widescreen_profile_page.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<SizecheckerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? MobileProfilePage()
                : WidescreenProfilePage(),
          );
        },
      ),
    );
  }
}
