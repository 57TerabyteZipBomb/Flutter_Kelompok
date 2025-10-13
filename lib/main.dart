import 'package:flutter/material.dart';
import 'package:flutter_kelompok/routes/pages.dart';
import 'package:flutter_kelompok/routes/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "the fluttering",
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashscreen,
    );
  }
}
