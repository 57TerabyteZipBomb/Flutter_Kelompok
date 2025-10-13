import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_ButtonNew.dart';
import 'package:flutter_kelompok/componenets/widget_countYourDays.dart';
import 'package:flutter_kelompok/componenets/widget_droppinDown.dart';
import 'package:flutter_kelompok/componenets/widget_textfieldNew.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

class WidescreenListaddPage extends StatefulWidget {
  const WidescreenListaddPage({super.key});

  @override
  State<WidescreenListaddPage> createState() => _WidescreenListaddPageState();
}

class _WidescreenListaddPageState extends State<WidescreenListaddPage> {
  final editController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    // ✅ Safe post-build initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (editController.urgency.value.isEmpty) {
        editController.urgency.value = "Normal";
      }
      editController.stattext.value = ""; // Clear any leftover error
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("Add List"), centerTitle: true),
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Create New List",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        SizedBox(
                          width: 400,
                          child: CustomTextField(
                            textEditingController: editController.txtitle,
                            label: 'List Title',
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          child: CustomTextField(
                            textEditingController: editController.txtsum,
                            label: 'Summary',
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          child: Obx(() => CustomDropdown(
                                label: "Urgency",
                                value: editController.urgency.value.isEmpty
                                    ? null
                                    : editController.urgency.value,
                                items: const ["Low", "Normal", "High", "Urgent"],
                                onChanged: (val) => editController.urgency.value = val ?? "",
                              )),
                        ),
                        SizedBox(
                          width: 400,
                          child: CustomDatePicker(
                            textEditingController: editController.txtdue,
                            label: 'Due Date',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Obx(() => Text(
                          editController.stattext.value,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(height: 30),


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
      ),
    ),
  );
}
}