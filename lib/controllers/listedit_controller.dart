import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';

class ListeditController extends GetxController {
  late int index;
  late Rxn<Lists> list;

  final txtitle = TextEditingController();
  final txtsum = TextEditingController();
  final txturg = TextEditingController();
  final txtdue = TextEditingController();

  final HomeController listController = Get.find();

  var stattext = "".obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args is Map<String, dynamic> &&
        args['title'] is Lists &&
        args['index'] is int) {
      index = args['index'] as int;
      list = Rxn<Lists>(args['title'] as Lists);

      //fill controllers on init, if values are null fill with ""
      txtitle.text = list.value?.title ?? "";
      txtsum.text = list.value?.summary ?? "";
      txturg.text = list.value?.urgency ?? "";
      txtdue.text = list.value?.due ?? "";
    } else {
      index = 0;
      list = Rxn<Lists>();
    }
  }

  //ya
  void saveChanges() {
    if (txtitle.text.isEmpty ||
        txtsum.text.isEmpty ||
        txturg.text.isEmpty ||
        txtdue.text.isEmpty) {
      stattext.value = "All fields must be filled";
      return;
    }

    stattext.value = "";

    if (list.value != null) {
      listController.updateList(
        index,
        Lists(
          title: txtitle.text,
          summary: txtsum.text,
          urgency: txturg.text,
          due: txtdue.text,
          isClear: list.value!.isClear,
        ),
      );
    }

    //i feel so sigma
    Get.back();
  }
}