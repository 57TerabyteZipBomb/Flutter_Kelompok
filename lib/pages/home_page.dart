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
         child: Obx(
          () => ListView.builder(
            itemCount: HomeController().TodoList.length,
            itemBuilder: (context, index) {
              final player = HomeController().TodoList[index];
              return ListTile(
                onTap: () {
                  Get.snackbar(
                    'Item Clicked',
                    player.title,
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 12,
                    margin: const EdgeInsets.all(12),
                  );

                  Get.toNamed(
                    AppRoutes.listedit,
                    arguments: {'player': player, 'index': index},
                  );
                },
                title: Text(player.title),
              );
            },
          ),
      ),
    ),
  );
  }
}