import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  final double price;

  const PriceLabel({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Rp " + price.toStringAsFixed(0),

      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
    );
  }
}