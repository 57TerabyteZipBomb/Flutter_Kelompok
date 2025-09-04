import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/home_controller.dart';
import 'package:flutter_kelompok/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final menuController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My To-do list ong 🙏🙏🙏🥀🥀🥀")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() {
          final activeItems = menuController.TodoList.where(
            (item) => !item.isClear,
          ).toList();
          return ListView.builder(
            itemCount: activeItems.length,
            itemBuilder: (context, index) {
              final List = activeItems[index];
              final originalIndex = menuController.TodoList.indexOf(List);
              return ListTile(
                leading: Checkbox(
                  value: List.isClear,
                  onChanged: (bool? value) {
                    menuController.TodoList[originalIndex].isClear =
                        value ?? false;
                    menuController.TodoList.refresh();
                  },
                ),
                onTap: () {
                  Get.snackbar(
                    'Item Clicked',
                    List.title,
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 12,
                    margin: const EdgeInsets.all(12),
                  );
                  Get.toNamed(
                    AppRoutes.listedit,
                    arguments: {'title': List, 'index': originalIndex},
                  );
                },
                title: Text(List.title),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Call the delete function
                    menuController.deleteList(originalIndex);
                  },
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.listadd);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
