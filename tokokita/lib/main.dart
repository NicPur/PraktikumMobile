import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/main_page.dart';
import 'controllers/cart_controller.dart';

void main() {
  Get.put(CartController());

  runApp(
    const TokoKitaApp(),
  );
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TokoKita",

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const MainPage(),
    );
  }
}