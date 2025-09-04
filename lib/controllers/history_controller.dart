import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final menuController = Get.find<HomeController>();

    List get checkedItems =>
      menuController.TodoList.where((item) => item.isClear).toList();
}
