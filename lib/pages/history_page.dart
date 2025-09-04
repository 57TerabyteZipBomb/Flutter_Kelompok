import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_awesomeCard.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final menuController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Done")),
      body: Obx(() {
        final checkedItems = menuController.checkedItems;
        if (checkedItems.isEmpty) {
          return Opacity(
            opacity: 0.5,
            child: Center(child: Image.asset('assets/ulkil.png', width: 250)),
          );
        }
        return ListView.builder(
          itemCount: checkedItems.length,
          itemBuilder: (context, index) {
            final item = checkedItems[index];
            final originalIndex = menuController.TodoList.indexOf(item);

            return AwesomeCard(
              list: item,
              onCheck: (value) {
                menuController.TodoList[originalIndex].isClear = value ?? false;
                menuController.TodoList.refresh();
              },
            );
          },
        );
      }),
    );
  }
}
