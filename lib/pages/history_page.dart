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
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          final checkedItems = menuController.checkedItems;
          if (checkedItems.isEmpty) {
            return Center(
              child: Text(
                "No completed tasks\n(lazy bum)",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemCount: checkedItems.length,
            itemBuilder: (context, index) {
              final item = checkedItems[index];
              final originalIndex = menuController.TodoList.indexOf(item);

              return AwesomeCard(
                list: item,
                onCheck: (value) async {
                  menuController.TodoList[originalIndex].isClear =
                      value ?? false;
                  await menuController.updateList(
                    originalIndex,
                    menuController.TodoList[originalIndex],
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
