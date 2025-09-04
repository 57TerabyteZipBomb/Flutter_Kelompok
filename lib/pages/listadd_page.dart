import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kelompok/componenets/widget_EditButton.dart';
import 'package:flutter_kelompok/componenets/widget_EditTextField.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
      appBar: AppBar(title: Text("Add List"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyEditingTextField(
              textEditingController: titleController,
              label: 'List title',
            ),

            const SizedBox(height: 30),

            MyEditingTextField(
              textEditingController: sumController,
              label: 'Summary',
            ),

            const SizedBox(height: 30),

            MyEditingTextField(
              textEditingController: urgenController,
              label: 'Urgency',
            ),

            const SizedBox(height: 30),

            MyEditingTextField(
              textEditingController: dueController,
              label: 'Due Date',
            ),

            const SizedBox(height: 30),

            MyEditingButton(
              text: 'Add new List',
              textcolor: Colors.cyanAccent,
              onPressed: () {
                editController.addList(
                  Lists(
                    title: titleController.text,
                    summary: sumController.text,
                    urgency: urgenController.text,
                    due: dueController.text,
                    isClear: false
                  ),
                );

                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
