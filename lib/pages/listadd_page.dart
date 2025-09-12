import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../componenets/widget_ButtonNew.dart';
import '../componenets/widget_textfieldNew.dart';

class ListaddPage extends StatelessWidget {
  ListaddPage({super.key});

  final editController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add List"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              textEditingController: editController.txtitle,
              label: 'List title',
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
            const SizedBox(height: 20),
            Obx(
              () => Text(
                editController.stattext.value,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Add new List',
              textcolor: Colors.white,
              bgcolor: Colors.blueAccent,
              onPressed: () {
                editController.addList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
