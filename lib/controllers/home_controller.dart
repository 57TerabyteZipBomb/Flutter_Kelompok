import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var TodoList = <Lists>[
    Lists(
      title: "Tugas Mobile Dev",
      summary: "Project kelompok 2 karakter",
      urgency: "Not Very",
      due: "16",
      isClear: false,
    ),
    Lists(
      title: "Tugas Game Dev",
      summary: "Project 3D Mockup",
      urgency: "Not Very",
      due: "8",
      isClear: false,
    ),
    Lists(
      title: "Tugas Bahasa Jepang",
      summary: "Presentasi Interview (Mensetsu)",
      urgency: "Not Very",
      due: "9",
      isClear: false,
    ),
  ].obs;

  void updateList(int index, Lists updatePlayer) {
    TodoList[index] = updatePlayer;
  }

  void addList(Lists list) {
    TodoList.add(list);
  }

  void deleteList(int index) {
    TodoList.removeAt(index);
  }

  List<Lists> get activeItems =>
      TodoList.where((item) => !item.isClear).toList();

  List<Lists> get checkedItems =>
      TodoList.where((item) => item.isClear).toList();
}
