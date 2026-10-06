import 'package:flutter/material.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';

void main() {
  runApp(
    const TokoKitaApp(),
  );
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "TokoKita",

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // HALAMAN AWAL
      initialRoute: '/',

      // ROUTES
      routes: {
        '/': (context) {
          return const MainPage();
        },
        '/detail': (context) {
          return const ProductDetailPage();
        },
      },
    );
  }
}