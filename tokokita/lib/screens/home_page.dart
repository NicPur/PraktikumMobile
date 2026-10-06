import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        title: const Text(
          "TokoKita",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          // HEADER
          Container(
            padding: const EdgeInsets.all(16),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "Selamat Datang di TokoKita",

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Belanja jadi lebih mudah",

                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // DAFTAR PRODUK
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),

              itemCount: products.length,

              itemBuilder: (context, index) {

                return ProductCard(
                  product: products[index],

                  onTap: () async {

                    final hasil =
                        await Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: products[index],
                    );

                    // HASIL DARI DETAIL
                    if (hasil != null) {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            "${products[index].name} "
                            "ditambahkan sebanyak $hasil",
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}