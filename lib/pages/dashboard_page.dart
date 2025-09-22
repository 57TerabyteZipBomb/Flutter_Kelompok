import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/todo_controller.dart';
import 'package:flutter_kelompok/pages/history_page.dart';
import 'package:flutter_kelompok/pages/home_page.dart';
import 'package:flutter_kelompok/pages/profile_page.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final menuController = Get.find<TodoController>();

  final List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage()];
  final List<String> pagenames = ["Home", "History", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            pagenames[menuController.selectedIndex.value],
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        // im port ant!!
        body: pages[menuController.selectedIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: menuController.selectedIndex.value,
          onTap: menuController.changeTab,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color: Colors.white10),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
