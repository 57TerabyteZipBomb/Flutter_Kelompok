import 'package:flutter/material.dart';
import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //textfields now use controllers defined here
  final TextEditingController txtitle = TextEditingController();
  final TextEditingController txtsum = TextEditingController();
  final TextEditingController txtdue = TextEditingController();

  var urgency = "".obs;
  var stattext = "".obs;

  //todolist is stored in here lol
  //filled with hardcoded stuff
  var TodoList = <Lists>[
    Lists(
      title: "Tugas Mobile Dev",
      summary: "Project kelompok 2 karakter",
      urgency: "High",
      due: "2025-09-25",
      isClear: false,
    ),
    Lists(
      title: "Tugas Game Dev",
      summary: "Project 3D Mockup",
      urgency: "Normal",
      due: "2025-09-27",
      isClear: false,
    ),
    Lists(
      title: "Tugas Bahasa Jepang",
      summary: "Presentasi Interview (Mensetsu)",
      urgency: "Low",
      due: "2025-09-30",
      isClear: false,
    ),
  ].obs;

  //this is called in listedit_controller
  void updateList(int index, Lists updatePlayer) {
    TodoList[index] = updatePlayer;
  }

  //check if empty then add if not
  void addList() {
    if (txtitle.text.isEmpty ||
        txtsum.text.isEmpty ||
        urgency.value.isEmpty ||
        txtdue.text.isEmpty) {
      stattext.value = "All fields must be filled";
      return;
    }

    TodoList.add(
      Lists(
        title: txtitle.text,
        summary: txtsum.text,
        urgency: urgency.value,
        due: txtdue.text,
        isClear: false,
      ),
    );

    stattext.value = "";

    txtitle.clear();
    txtsum.clear();
    urgency.value = "";
    txtdue.clear();

    //get.back moved here
    Get.back();
  }

  void deleteList(int index) {
    TodoList.removeAt(index);
  }

  List<Lists> get activeItems =>
      TodoList.where((item) => !item.isClear).toList();

  List<Lists> get checkedItems =>
      TodoList.where((item) => item.isClear).toList();
}
