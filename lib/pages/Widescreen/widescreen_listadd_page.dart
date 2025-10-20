import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_ButtonNew.dart';
import 'package:flutter_kelompok/componenets/widget_countYourDays.dart';
import 'package:flutter_kelompok/componenets/widget_droppinDown.dart';
import 'package:flutter_kelompok/componenets/widget_textfieldNew.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

class WidescreenListaddPage extends StatelessWidget {
  const WidescreenListaddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final editController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Add List"), centerTitle: true),
      body: Center(
        widthFactor: 500,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Two-column layout
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left column
                      Expanded(
                        child: Column(
                          children: [
                            CustomTextField(
                              textEditingController: editController.txtitle,
                              label: 'List Title',
                            ),
                            const SizedBox(height: 24),
                            CustomTextField(
                              textEditingController: editController.txtsum,
                              label: 'Summary',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 32),

                      // Right column
                      Expanded(
                        child: Column(
                          children: [
                            Obx(
                              () => CustomDropdown(
                                label: "Urgency",
                                value: editController.urgency.value.isEmpty
                                    ? null
                                    : editController.urgency.value,
                                items: const [
                                  "Low",
                                  "Normal",
                                  "High",
                                  "Urgent",
                                ],
                                onChanged: (val) =>
                                    editController.urgency.value = val ?? "",
                              ),
                            ),
                            const SizedBox(height: 24),
                            CustomDatePicker(
                              textEditingController: editController.txtdue,
                              label: 'Due Date',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Error message
                  Obx(
                    () => Text(
                      editController.stattext.value,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),


                  // Submit button
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      child: CustomButton(
                        text: 'Add New List',
                        textcolor: Colors.white,
                        bgcolor: Colors.blueAccent,
                        onPressed: () => editController.addList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
