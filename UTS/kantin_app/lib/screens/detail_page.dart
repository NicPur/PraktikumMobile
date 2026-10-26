import 'package:flutter/material.dart';
import '../models/menu.dart';
import '../widgets/custom_text.dart';

class DetailPage extends StatelessWidget {
  final MenuKantin menu;

  const DetailPage({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Detail Menu",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.restaurant_menu,
                  size: 64,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                CustomText(
                  text: menu.nama,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                CustomText(
                  text: "Rp ${menu.harga.toStringAsFixed(0)}",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}