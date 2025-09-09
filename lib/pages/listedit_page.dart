import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_ButtonNew.dart';
import 'package:flutter_kelompok/componenets/widget_textfieldNew.dart';
import 'package:flutter_kelompok/controllers/listedit_controller.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(title: const Text("Edit Task"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // consistent spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              textEditingController: titleController,
              label: 'Title',
              onChanged: editController.updateTitle,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              textEditingController: summController,
              label: 'Summary',
              onChanged: editController.updateSumm,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              textEditingController: urgencyController,
              label: 'Urgency',
              onChanged: editController.updateUrgency,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              textEditingController: dueController,
              label: 'Due Date',
              onChanged: editController.updateDate,
            ),
            const SizedBox(height: 30),

            CustomButton(
              text: 'Apply Edit',
              textcolor: Colors.white,
              bgcolor: Colors.blueAccent,
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
