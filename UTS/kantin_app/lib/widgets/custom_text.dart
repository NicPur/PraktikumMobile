import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Alasan Desain: Memilih font Poppins dari Google Fonts karena tampilannya yang modern,
// bersih, serta memiliki tingkat keterbacaan (legibility) yang sangat tinggi
// untuk aplikasi daftar menu kantin pada perangkat mobile.
class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}