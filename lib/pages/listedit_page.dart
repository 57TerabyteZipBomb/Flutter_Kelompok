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
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //removed on change
            //now it checks for all the values at once when pressing apply edit

            CustomTextField(
              textEditingController: editController.txtitle,
              label: 'Title',
            ),
            const SizedBox(height: 20),

            CustomTextField(
              textEditingController: editController.txtsum,
              label: 'Summary',
            ),
            const SizedBox(height: 20),

            CustomTextField(
              textEditingController: editController.txturg,
              label: 'Urgency',
            ),
            const SizedBox(height: 20),

            CustomTextField(
              textEditingController: editController.txtdue,
              label: 'Due Date',
            ),
            const SizedBox(height: 30),

            Obx(
              () => Text(
                editController.stattext.value,
                style: const TextStyle(color: Colors.red),
              ),
            ),

            CustomButton(
              text: 'Apply Edit',
              textcolor: Colors.white,
              bgcolor: Colors.blueAccent,
              onPressed: () => editController.saveChanges(),
            ),
          ],
        ),
      ),
    );
  }
}