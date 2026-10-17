import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController controller =
        Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        actions: [
          Obx(
            () => controller.totalItem > 0
                ? IconButton(
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text(
                            "Kosongkan Keranjang?",
                          ),
                          content: const Text(
                            "Semua produk akan dihapus "
                            "dari keranjang.",
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

                                Get.snackbar(
                                  "Berhasil",
                                  "Keranjang sudah dikosongkan",
                                );
                              },
                              child: const Text("Ya, Kosongkan"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.delete_sweep,
                    ),
                    tooltip: "Kosongkan Keranjang",
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),

      body: Obx(
        () {
          if (controller.cartItems.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Keranjang masih kosong",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Silakan pilih produk di Beranda",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.cartItems.length,

                  itemBuilder: (context, index) {
                    final product =
                        controller.cartItems[index];

                    return Card(
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8),
                              child: Image.network(
                                product.imageUrl,
                                width: 85,
                                height: 85,
                                fit: BoxFit.cover,
                                errorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return Container(
                                    width: 85,
                                    height: 85,
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image,
                                      size: 35,
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    "Rp ${product.price.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  // QUANTITY
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller
                                              .kurangiJumlah(
                                            product,
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                        visualDensity:
                                            VisualDensity.compact,
                                      ),

                                      Obx(
                                        () => Text(
                                          (controller.quantities[
                                                      product.id] ??
                                                  1)
                                              .toString(),
                                          style: const TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          controller
                                              .tambahJumlah(
                                            product,
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                        ),
                                        visualDensity:
                                            VisualDensity.compact,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                controller.removeFromCart(
                                  product,
                                );
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              tooltip: "Hapus produk",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // TOTAL HARGA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(
                        alpha: 0.2,
                      ),
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Belanja",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Obx(
                            () => Text(
                              "Rp ${controller.totalHarga.toStringAsFixed(0)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(
                              () => const CheckoutPage(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(14),
                          ),
                          child: const Text(
                            "Lanjut Checkout",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}