import 'package:flutter/material.dart';
import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TokoKita",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "TokoKita",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ProductCard(product: products[0]),
                ),
                Expanded(
                  child: ProductCard(product: products[1]),
                ),
              ],       
            ),
            Row(
              children: [
                Expanded(
                  child: ProductCard(product: products[2]),
                ),
                Expanded(
                  child: ProductCard(product: products[3]),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ProductCard(product: products[4]),
                ),
                Expanded(
                  child: ProductCard(product: products[5]),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ProductCard(product: products[6]),
                ),
                Expanded(
                  child: ProductCard(product: products[7]),
                ),
              ],
            ),
          ],
      ),
    )
    );
  }
}