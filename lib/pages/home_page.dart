import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_awesomeCard.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final menuController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          //image shows depending on if list has stuff or not
          final activeItems = menuController.activeItems;
          if (activeItems.isEmpty) {
            return Center(
              child: Text(
                "No tasks here...\npress + on the bottom right to create a new one",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemCount: activeItems.length,
            itemBuilder: (context, index) {
              final list = activeItems[index];
              final originalIndex = menuController.TodoList.indexOf(list);

              return AwesomeCard(
                list: list,
                onCheck: (value) {
                  menuController.TodoList[originalIndex].isClear =
                      value ?? false;
                  menuController.TodoList.refresh();
                },
                onTap: () {
                  Get.toNamed(
                    AppRoutes.listedit,
                    arguments: {'title': list, 'index': originalIndex},
                  );
                },
                onDelete: () => menuController.deleteList(originalIndex),
              );
            },
          );
        }),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.listadd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
