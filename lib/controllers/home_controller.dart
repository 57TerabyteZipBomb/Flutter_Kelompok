import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var TodoList = [
    Lists(
      title: "Tugas Mobile Dev",
      summary: "Project kelompok 2 karakter",
      urgency: "Not Very",
      due: "16",
    ),
    Lists(
      title: "Tugas Game Dev",
      summary: "Project 3D Mockup",
      urgency: "Not Very",
      due: "8",
    ),
    Lists(
      title: "Tugas Bahasa Jepang",
      summary: "Presentasi Interview (Mensetsu)",
      urgency: "Not Very",
      due: "9",
    ),
  ].obs;

  void updateList(int index, Lists updatePlayer) {
    TodoList[index] = updatePlayer;
  }
}
