import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
  });

  @override
  State<ProductDetailPage> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState
    extends State<ProductDetailPage> {

  int jumlah = 1;

  @override
  Widget build(BuildContext context) {

    final Product product =
        ModalRoute.of(context)!
            .settings
            .arguments as Product;

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Detail Produk",
        ),

        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // GAMBAR PRODUK
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12),

              child: Image.network(
                product.imageUrl,

                width: double.infinity,
                height: 250,

                fit: BoxFit.cover,

                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {

                  return Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey[300],

                    child: const Icon(
                      Icons.image,
                      size: 70,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // NAMA
            Text(
              product.name,

              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // HARGA
            Text(
              "Rp ${product.price.toStringAsFixed(0)}",

              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // KATEGORI
            Text(
              "Kategori: ${product.category}",

              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            // STATUS
            Text(
              "Status: ${product.getStatusStok()}",

              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,

                color:
                    product.getStatusStok() ==
                            "Tersedia"
                        ? Colors.green
                        : product.getStatusStok() ==
                                "Stok Terbatas"
                            ? Colors.orange
                            : Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            // DESKRIPSI
            Text(
              product.description ??
                  "Produk ${product.name} berkualitas "
                  "dan cocok digunakan untuk kebutuhan "
                  "sehari-hari.",

              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // JUMLAH
            const Text(
              "Jumlah",

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                IconButton(
                  onPressed: jumlah > 1
                      ? () {
                          setState(() {
                            jumlah--;
                          });
                        }
                      : null,
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),

                Text(
                  "$jumlah",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                IconButton(
                  onPressed: () {
                    setState(() {
                      jumlah++;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // TOMBOL TAMBAH KERANJANG
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {

                  Navigator.pop(
                    context,
                    jumlah,
                  );
                },

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                ),

                child: const Text(
                  "Tambah ke Keranjang",

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}