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
  void initState() {
    super.initState();
    print("ProductCard initState: " + widget.product.name);
  }

  @override
  Widget build(BuildContext context) {
    print("ProductCard build: " + widget.product.name);

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GAMBAR PRODUK
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.product.imageUrl,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 130,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      size: 60,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // NAMA PRODUK
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            // HARGA
            Text(
              "Rp " + widget.product.price.toStringAsFixed(0),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 6),

            // STATUS STOK
            StockBadge(
              status: widget.product.getStatusStok(),
            ),

            const SizedBox(height: 5),

            // CATEGORY TAG
            CategoryTag(
              category: widget.product.category,
            ),

            const SizedBox(height: 8),

            // LIKE DAN COMMENT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // LIKE
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
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
                    const SizedBox(width: 4),
                    const Text("Like"),
                  ],
                ),
                // COMMENT
                Row(
                  children: [
                    const Icon(
                      Icons.comment_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    const Text("Comment"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("ProductCard dispose: " + widget.product.name);
    super.dispose();
  }
}

class StockBadge extends StatelessWidget {
  final String status;

  const StockBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color warna;

    if (status == "Tersedia") {
      warna = Colors.green;
    } else if (status == "Stok Terbatas") {
      warna = Colors.orange;
    } else {
      warna = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      color: warna,
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class CategoryTag extends StatelessWidget {
  final String category;

  const CategoryTag({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Kategori: " + category,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
      ),
    );
  }
}