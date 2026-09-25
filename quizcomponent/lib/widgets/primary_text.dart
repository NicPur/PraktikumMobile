import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double size;

  const PrimaryText({
    super.key,
    required this.text,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF333333),
      ),
    );
  }
}