
import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_ButtonNew.dart';
import 'package:flutter_kelompok/controllers/login_controller.dart';
import 'package:get/get.dart';

class MobileProfilePage extends StatelessWidget {
  MobileProfilePage({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Our Team"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {
                loginController.logout();
              },
              text: "very not-obviously put LOGOUT button",
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // member 1
                Expanded(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                              3,
                            ), // thickness of the border
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue, // border/background color
                            ),
                            child: const CircleAvatar(
                              radius: 40,
                              foregroundImage: AssetImage("assets/galih.png"),
                              backgroundColor: Colors.white, // inner fallback
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Galih Pradiwangsa Pratama",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "11 PPLG 1, 14",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "galihpriadiwangsa2.0@gmail.com",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // member 2
                Expanded(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                              3,
                            ), // thickness of the border
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue, // border/background color
                            ),
                            child: const CircleAvatar(
                              radius: 40,
                              foregroundImage: AssetImage("assets/gerrard.png"),
                              backgroundColor: Colors.white, // inner fallback
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Gerrard Yazdan Arkinara",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "11 PPLG 1, 15",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "gerrard.arkinara@gmail.com",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
