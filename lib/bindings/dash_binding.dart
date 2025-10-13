import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/controllers/history_controller.dart';
import 'package:flutter_kelompok/controllers/login_controller.dart';
import 'package:flutter_kelompok/controllers/sizechecker_controller.dart';

import 'package:flutter_kelompok/controllers/todo_controller.dart';
import 'package:get/get.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SizecheckerController>(() => SizecheckerController());
  }
}
