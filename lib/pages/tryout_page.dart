import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_countYourDays.dart';
import 'package:flutter_kelompok/componenets/widget_droppinDown.dart';
import 'package:flutter_kelompok/componenets/widget_textfieldNew.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

class TryoutPage extends StatelessWidget {
  TryoutPage({super.key});

  final editController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('THe fuckaround-inator')),
      body: Row(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                CustomTextField(textEditingController: editController.txtitle),
                CustomTextField(textEditingController: editController.txtsum),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => CustomDropdown(
                    label: "Urgency",
                    value: editController.urgency.value.isEmpty
                        ? null
                        : editController.urgency.value,
                    items: const ["Low", "Normal", "High", "Urgent"],
                    onChanged: (val) =>
                        editController.urgency.value = val ?? "",
                  ),
                ),
                CustomDatePicker(
                  textEditingController: editController.txtdue,
                  label: 'Due Date',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
