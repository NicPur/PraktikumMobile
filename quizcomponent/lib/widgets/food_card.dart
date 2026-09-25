import 'package:flutter/material.dart';
import '../models/food.dart';
import 'price_label.dart';
import 'primary_button.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;

  const FoodCard({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.orange.withOpacity(0.2),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // GAMBAR MAKANAN
            ClipRRect(
              borderRadius: BorderRadius.circular(14),

              child: Image.network(
                food.imageUrl,

                width: double.infinity,

                // Tinggi mengikuti ukuran asli gambar
                fit: BoxFit.fitWidth,
              ),
            ),

            const SizedBox(height: 12),

            // NAMA MAKANAN
            Text(
              food.name,

              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            // HARGA
            PriceLabel(
              price: food.price,
            ),

            const SizedBox(height: 12),

            // TOMBOL
            PrimaryButton(
              text: "Lihat Detail",
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}