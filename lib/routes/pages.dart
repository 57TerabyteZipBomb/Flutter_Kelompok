import 'package:flutter_kelompok/bindings/add_binding.dart';
import 'package:flutter_kelompok/bindings/dash_binding.dart';
import 'package:flutter_kelompok/bindings/history_binding.dart';
import 'package:flutter_kelompok/bindings/home_binding.dart';
import 'package:flutter_kelompok/bindings/listedit_binding.dart';
import 'package:flutter_kelompok/bindings/login_binding.dart';
import 'package:flutter_kelompok/pages/dashboard_page.dart';
import 'package:flutter_kelompok/pages/history_page.dart';
import 'package:flutter_kelompok/pages/home_page.dart';
import 'package:flutter_kelompok/pages/listadd_page.dart';
import 'package:flutter_kelompok/pages/listedit_page.dart';
import 'package:flutter_kelompok/pages/profile_page.dart';
import 'package:flutter_kelompok/pages/login_page.dart';
import 'package:flutter_kelompok/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
    GetPage(
      name: AppRoutes.history,
      page: () => HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.listedit,
      page: () => ListEditPage(),
      binding: ListeditBinding(),
    ),
    GetPage(
      name: AppRoutes.listadd,
      page: () => ListaddPage(),
      binding: ListAddBinding(),
    ),
  ];
}
