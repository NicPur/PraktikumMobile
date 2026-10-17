import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'main_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller =
        Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(
            child: Text(
              "Keranjang masih kosong",
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // INFORMASI PESANAN
            const Text(
              "Ringkasan Pesanan",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // DAFTAR PRODUK
            ...controller.cartItems.map((product) {
              final int jumlah =
                  controller.quantities[product.id] ?? 0;

              final double subtotal =
                  product.price * jumlah;

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        width: 55,
                        height: 55,
                        child: Icon(Icons.image, size: 35),
                      );
                    },
                  ),
                  title: Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "$jumlah barang × Rp "
                    "${product.price.toStringAsFixed(0)}",
                  ),
                  trailing: Text(
                    "Rp ${subtotal.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // TOTAL PEMBAYARAN
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.receipt_long,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Rincian Pembayaran",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total barang"),
                        Text("${controller.totalItem} barang"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Divider(),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Pembayaran",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp ${controller.totalHarga.toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // KONFIRMASI PESANAN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text("Konfirmasi Pesanan"),
                      content: Text(
                        "Apakah kamu yakin ingin menyelesaikan "
                        "pesanan dengan total pembayaran "
                        "Rp ${controller.totalHarga.toStringAsFixed(0)}?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Batal"),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            controller.kosongkanKeranjang();

                            Get.back();

                            Get.off(
                              () => const MainPage(),
                            );

                            Get.snackbar(
                              "Pesanan Berhasil",
                              "Checkout berhasil dikonfirmasi!",
                              snackPosition:
                                  SnackPosition.BOTTOM,
                            );
                          },
                          child: const Text("Konfirmasi"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle),
                label: const Text(
                  "Konfirmasi Pesanan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}