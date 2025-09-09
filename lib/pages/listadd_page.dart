import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../componenets/widget_ButtonNew.dart';
import '../componenets/widget_textfieldNew.dart';

class ListaddPage extends StatelessWidget {
  ListaddPage({super.key});

  final editController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final sumController = TextEditingController();
    final urgenController = TextEditingController();
    final dueController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add List"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              textEditingController: titleController,
              label: 'List title',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textEditingController: sumController,
              label: 'Summary',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textEditingController: urgenController,
              label: 'Urgency',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textEditingController: dueController,
              label: 'Due Date',
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Add new List',
              textcolor: Colors.white,
              bgcolor: Colors.blueAccent,
              onPressed: () {
                if (titleController.text != "" || urgenController.text != "") {
                  editController.addList(
                    Lists(
                      title: titleController.text,
                      summary: sumController.text,
                      urgency: urgenController.text,
                      due: dueController.text,
                      isClear: false,
                    ),
                  );
                  Get.back();
                } else {
                  //gerrard help
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
