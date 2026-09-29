import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 224, 226),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withValues(alpha: 0.2),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GAMBAR + BADGE DISKON
            Stack(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.network(
                    widget.product.imageUrl,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,

                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return Container(
                        width: 130,
                        height: 130,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),

                // BADGE DISKON
                if (widget.product is DiscountedProduct)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "Diskon",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            // INFORMASI PRODUK
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // NAMA PRODUK + TOMBOL LOVE
                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // TOMBOL LOVE
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // HARGA
                  Text(
                    "Rp ${widget.product.price.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // STATUS STOK
                  Text(
                    widget.product.getStatusStok(),
                    style: TextStyle(
                      fontSize: 13,
                      color: widget.product.getStatusStok() == "Tersedia"
                          ? Colors.green
                          : widget.product.getStatusStok() == "Stok Terbatas"
                              ? Colors.orange
                              : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // KATEGORI
                  Text(
                    widget.product.category,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}