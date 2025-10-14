import 'package:flutter/material.dart';

import 'package:flutter_kelompok/controllers/sizechecker_controller.dart';
import 'package:flutter_kelompok/pages/Mobile/mobile_listadd_page.dart';
import 'package:flutter_kelompok/pages/Widescreen/widescreen_listadd_page.dart';
import 'package:get/get.dart';


class ListaddPage extends StatelessWidget {
  ListaddPage({super.key});

  final controller = Get.find<SizecheckerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // ✅ Safe: delay reactive mutation until after build
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.updateLayout(constraints);
          });

          return Obx(
            () => controller.isMobile.value
                ? MobileListaddPage()
                : WidescreenListaddPage(),
          );
        },
      ),
    );
  }
}

