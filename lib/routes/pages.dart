import 'package:flutter_kelompok/bindings/login_binding.dart';
import 'package:flutter_kelompok/pages/login_page.dart';
import 'package:flutter_kelompok/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login, 
      page: () => LoginPage(),
      binding: LoginBinding())
  ];
}