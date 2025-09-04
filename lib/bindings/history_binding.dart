import 'package:flutter_kelompok/controllers/history_controller.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
