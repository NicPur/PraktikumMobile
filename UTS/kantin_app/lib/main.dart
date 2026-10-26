import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/menu_list_page.dart';

void main() {
  runApp(const KantinApp());
}

class KantinApp extends StatelessWidget {
  const KantinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Menu Kantin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuListPage(),
    );
  }
}