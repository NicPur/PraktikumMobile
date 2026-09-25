import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/primary_text.dart';
import '../widgets/price_label.dart';
import '../widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
  final Food food;
  final int quantity;

  const CartScreen({
    super.key,
    required this.food,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    double total = food.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Card(
              color: Colors.white,
              elevation: 4,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: Padding(
                padding: const EdgeInsets.all(12),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),

                      child: Image.network(
                        food.imageUrl,

                        width: double.infinity,

                        fit: BoxFit.fitWidth,
                      ),
                    ),

                    const SizedBox(height: 15),

                    PrimaryText(
                      text: food.name,
                      size: 22,
                    ),

                    const SizedBox(height: 6),

                    PriceLabel(
                      price: food.price,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Jumlah: $quantity",

                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.white,
              elevation: 3,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      "Total",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    PriceLabel(
                      price: total,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              text: "Checkout",

              onPressed: () {
                showDialog(
                  context: context,

                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "Pesanan Berhasil!",
                      ),

                      content: const Text(
                        "Pesanan kamu berhasil dibuat.",
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);

                            Navigator.of(context)
                                .popUntil(
                              (route) => route.isFirst,
                            );
                          },

                          child: const Text(
                            "Kembali ke Home",
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}