import 'package:flutter_kelompok/controllers/sizechecker_controller.dart';
import 'package:flutter_kelompok/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenContoller>(() => SplashscreenContoller());
    Get.lazyPut<SizecheckerController>(() => SizecheckerController());
  }
}
