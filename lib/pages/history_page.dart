import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final menuController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Done")),
      body: Obx(() {
        final checkedItems = menuController.checkedItems;
        return ListView.builder(
          itemCount: checkedItems.length,
          itemBuilder: (context, index) {
            final item = checkedItems[index];
            final originalIndex = menuController.TodoList.indexOf(item);
            return ListTile(
              leading: Checkbox(
                value: item.isClear,
                onChanged: (bool? value) {
                  menuController.TodoList[originalIndex].isClear =
                      value ?? false;
                  menuController.TodoList.refresh();
                },
              ),
              title: Text(item.title),
              subtitle: Text(item.summary),
            );
          },
        );
      }),
    );
  }
}
