import 'package:flutter/material.dart';
import 'package:flutter_kelompok/controllers/todo_controller.dart';
import 'package:flutter_kelompok/pages/history_page.dart';
import 'package:flutter_kelompok/pages/home_page.dart';
import 'package:flutter_kelompok/pages/profile_page.dart';
import 'package:get/get.dart';

class WidescreenDashboardPage extends StatelessWidget {
  WidescreenDashboardPage({super.key});

  final menuController = Get.find<TodoController>();

  final List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage()];
  final List<String> pagenames = ["Home", "History", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text(
            "Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/hydrogenbomb.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.green.withOpacity(0.5),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/hydrogenbomb.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'G&G',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '11 PPLG 1',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Houm'),
                onTap: () {
                  menuController.changeTab(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('History'),
                onTap: () {
                  menuController.changeTab(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  menuController.changeTab(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: pages[menuController.selectedIndex.value],
      ),
    );
  }
}
