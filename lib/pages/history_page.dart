import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/sizechecker_controller.dart';
import 'package:flutter_kelompok/pages/Mobile/mobile_history_page.dart';
import 'package:flutter_kelompok/pages/Widescreen/widescreen_history_page.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final controller = Get.find<SizecheckerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: LayoutBuilder(
        builder: (context, constraints) {
          //width size detection
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? MobileHistoryPage()
                : WidescreenHistoryPage(),
          );
        },
      ),
    );
  }
}
