import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class WidescreenSplashscreenPage extends StatelessWidget {
  WidescreenSplashscreenPage({super.key});

  final editController = Get.find<SplashscreenContoller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.asset('assets/bronload.gif', width: 200,)),
            SizedBox( height: 100,),
            SizedBox(
              // width: 250,
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 30.0, color: Colors.black),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Loading...',
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
