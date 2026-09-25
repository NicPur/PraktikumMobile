import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/primary_text.dart';
import '../widgets/price_label.dart';
import '../widgets/primary_button.dart';
import '../widgets/quantity_button.dart';
import 'cart_screen.dart';

class DetailScreen extends StatefulWidget {
  final Food food;

  const DetailScreen({
    super.key,
    required this.food,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Makanan"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // GAMBAR MAKANAN
            ClipRRect(
              borderRadius: BorderRadius.circular(14),

              child: Image.network(
                widget.food.imageUrl,

                width: double.infinity,

                // Gambar memenuhi lebar dan tidak terpotong
                fit: BoxFit.fitWidth,
              ),
            ),

            const SizedBox(height: 20),

            // NAMA MAKANAN
            PrimaryText(
              text: widget.food.name,
              size: 26,
            ),

            const SizedBox(height: 8),

            // HARGA
            PriceLabel(
              price: widget.food.price,
            ),

            const SizedBox(height: 15),

            // DESKRIPSI
            Text(
              widget.food.description,

              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            // JUMLAH
            const Text(
              "Jumlah",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                QuantityButton(
                  icon: Icons.remove,

                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),

                Container(
                  width: 40,
                  alignment: Alignment.center,

                  child: Text(
                    quantity.toString(),

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                QuantityButton(
                  icon: Icons.add,

                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 25),

            // TOMBOL TAMBAH KE KERANJANG
            PrimaryButton(
              text: "Tambah ke Keranjang",

              onPressed: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) {
                      return CartScreen(
                        food: widget.food,
                        quantity: quantity,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}