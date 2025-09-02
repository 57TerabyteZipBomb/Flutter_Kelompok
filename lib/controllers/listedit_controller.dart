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
        args['player'] is Lists &&
        args['index'] is int) {
      index = args['index'] as int;
      list = Rxn<Lists>();
      list.value = args['player'] as Lists;
    } else {
      // Provide fallback/defaults or handle error
      index = 0;
      list = Rxn<Lists>();
      list.value = null;
      // Optionally, show an error or navigate back
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
