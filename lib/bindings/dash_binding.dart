import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/controllers/todo_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
