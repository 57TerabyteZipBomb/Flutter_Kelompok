import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';

class ListeditController extends GetxController {
  late int index;
  late Rxn<Lists> list;

  final HomeController listController = Get.find();

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args is Map<String, dynamic> &&
        args['title'] is Lists &&
        args['index'] is int) {
      index = args['index'] as int;
      list = Rxn<Lists>();
      list.value = args['title'] as Lists;
    } else {
      index = 0;
      list = Rxn<Lists>();
      list.value = null;
    }
  }

  void updateTitle(String value) => list.update((p) {
    if (p != null) p.title = value;
  });

  void updateSumm(String value) => list.update((p) {
    if (p != null) p.summary = value;
  });

  void updateUrgency(String value) => list.update((p) {
    if (p != null) p.urgency = value;
  });

  void updateDate(String value) => list.update((p) {
    if (p != null) p.due = value;
  });

  void saveChanges() {
    if (list.value != null) {
      listController.updateList(index, list.value!);
    }
  }
}
