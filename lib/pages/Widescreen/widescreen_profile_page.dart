import 'package:flutter/material.dart';
import 'package:flutter_kelompok/componenets/widget_ButtonNew.dart';
import 'package:flutter_kelompok/componenets/widget_sickmembercard';
import 'package:flutter_kelompok/controllers/login_controller.dart';
import 'package:get/get.dart';

class WidescreenProfilePage extends StatelessWidget {
  WidescreenProfilePage({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            // Added SingleChildScrollView to avoid vertical overflow
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      onPressed: () {
                        loginController.logout();
                      },
                      text: "very not-obviously put LOGOUT button",
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Use LayoutBuilder to compute card width so cards adapt and avoid horizontal overflow
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final available = constraints.maxWidth;
                      final cardWidth = available > 900
                          ? 400.0
                          : (available / 2) - 24.0;
                      final safeCardWidth = cardWidth.clamp(200.0, 400.0);

                      return Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: [
                          SizedBox(
                            width: safeCardWidth,
                            child: MemberCard(
                              image: "assets/galih.png",
                              name: "Galih Priadiwangsa Pratama",
                              classInfo: "11 PPLG 1",
                              email: "galihpriadiwangsa2.0@gmail.com",
                            ),
                          ),

                          SizedBox(
                            width: safeCardWidth,
                            child: MemberCard(
                              image: "assets/gerrard.png",
                              name: "Gerrard Yazdan Arkinara",
                              classInfo: "11 PPLG 1, 15",
                              email: "gerrard.arkinara@gmail.com",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
