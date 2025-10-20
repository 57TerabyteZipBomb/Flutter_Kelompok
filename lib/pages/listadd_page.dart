import 'package:flutter/material.dart';
import 'package:flutter_kelompok/pages/Mobile/mobile_listadd_page.dart';
import 'package:flutter_kelompok/pages/Widescreen/widescreen_listadd_page.dart';

class ListaddPage extends StatelessWidget {
  ListaddPage({super.key});

  // Breakpoint: under this width we show the mobile layout
  static const double mobileBreakpoint = 600;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final isMobile = width < mobileBreakpoint;

          // Choose the proper page directly from constraints so changes are immediate
          return isMobile ? MobileListaddPage() : WidescreenListaddPage();
        },
      ),
    );
  }
}