import 'package:flutter/material.dart';
import 'package:flutter_kelompok/helper/db_helper.dart';
import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController txtitle = TextEditingController();
  final TextEditingController txtsum = TextEditingController();
  final TextEditingController txtdue = TextEditingController();

  var urgency = "".obs;
  var stattext = "".obs;

  var TodoList = <Lists>[].obs;
  final DBHelper _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    final data = await _dbHelper.getTodos();
    TodoList.assignAll(data);
  }

  Future<void> addList() async {
    if (txtitle.text.isEmpty ||
        txtsum.text.isEmpty ||
        urgency.value.isEmpty ||
        txtdue.text.isEmpty) {
      stattext.value = "All fields must be filled";
      return;
    }

    final newList = Lists(
      title: txtitle.text,
      summary: txtsum.text,
      urgency: urgency.value,
      due: txtdue.text,
      isClear: false,
    );

    await _dbHelper.insertTodo(newList);
    await fetchTodos();

    stattext.value = "";
    txtitle.clear();
    txtsum.clear();
    urgency.value = "";
    txtdue.clear();
    Get.back();
  }

  Future<void> deleteList(int index) async {
    final list = TodoList[index];
    if (list.id != null) {
      await _dbHelper.deleteTodo(list.id!);
    }
    await fetchTodos();
  }

  Future<void> updateList(int index, Lists updated) async {
    final list = TodoList[index];
    if (list.id != null) {
      await _dbHelper.updateTodo(list.id!, updated);
    }
    await fetchTodos();
  }

  List<Lists> get activeItems => TodoList.where((item) => !item.isClear).toList();
  List<Lists> get checkedItems => TodoList.where((item) => item.isClear).toList();
}
