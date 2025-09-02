import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kelompok/componenets/widget_EditButton.dart';
import 'package:flutter_kelompok/componenets/widget_EditTextField.dart';
import 'package:flutter_kelompok/controllers/listedit_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ListEditPage extends StatelessWidget {
  ListEditPage({super.key});

  final editController = Get.find<ListeditController>();

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(
      text: editController.list.value?.title,
    );
    final summController = TextEditingController(
      text: editController.list.value?.summary,
    );
    final urgencyController = TextEditingController(
      text: editController.list.value?.urgency,
    );
    final dueController = TextEditingController(
      text: editController.list.value?.due,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Edit data"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyEditingTextField(
              textEditingController: titleController,
              label: 'Title',
            ),

            const SizedBox(height: 30),

            MyEditingTextField(
              textEditingController: summController,
              label: 'Summary',
            ),

            const SizedBox(height: 30),

            MyEditingTextField(
              textEditingController: urgencyController,
              label: 'Urgency',
            ),

            const SizedBox(height: 30),

            MyEditingTextField(
              textEditingController: dueController,
              label: 'Due Date',
            ),

            const SizedBox(height: 30),

            MyEditingButton(
              text: 'Apply Edit',
              textcolor: Colors.white,
              onPressed: () {
                editController.saveChanges();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
