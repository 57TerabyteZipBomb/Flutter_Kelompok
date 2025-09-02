import 'package:flutter_kelompok/controllers/listedit_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ListeditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListeditController>(() => ListeditController());
  }
}
