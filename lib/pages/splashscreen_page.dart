import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/splashscreen_contoller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final editController = Get.find<SplashscreenContoller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Image.asset('assets/oguwi.gif'))),
    );
  }
}
