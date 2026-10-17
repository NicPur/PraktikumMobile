import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  // DAFTAR PRODUK DALAM KERANJANG
  final RxList<Product> cartItems = <Product>[].obs;

  // JUMLAH SETIAP PRODUK
  final RxMap<int, int> quantities = <int, int>{}.obs;

  // MENAMBAHKAN PRODUK KE KERANJANG
  void addToCart(Product product) {
    final index = cartItems.indexWhere(
      (item) => item.id == product.id,
    );

    if (index != -1) {
      quantities[product.id] =
          (quantities[product.id] ?? 0) + 1;
    } else {
      cartItems.add(product);
      quantities[product.id] = 1;
    }
  }

  // MENGHAPUS PRODUK DARI KERANJANG
  void removeFromCart(Product product) {
    cartItems.removeWhere(
      (item) => item.id == product.id,
    );

    quantities.remove(product.id);
  }

  // MENAMBAH JUMLAH PRODUK
  void tambahJumlah(Product product) {
    final jumlah = quantities[product.id] ?? 0;

    if (jumlah < product.stock) {
      quantities[product.id] = jumlah + 1;
    } else {
      Get.snackbar(
        'Stok terbatas',
        'Jumlah tidak boleh melebihi stok produk.',
      );
    }
  }

  // MENGURANGI JUMLAH PRODUK
  void kurangiJumlah(Product product) {
    final jumlah = quantities[product.id] ?? 0;

    if (jumlah > 1) {
      quantities[product.id] = jumlah - 1;
    } else {
      removeFromCart(product);
    }
  }

  // TOTAL SEMUA ITEM DALAM KERANJANG
  int get totalItem {
    return quantities.values.fold(
      0,
      (total, jumlah) => total + jumlah,
    );
  }

  // TOTAL HARGA KERANJANG
  double get totalHarga {
    double total = 0;

    for (Product product in cartItems) {
      total += product.price *
          (quantities[product.id] ?? 0);
    }

    return total;
  }

  // MENGOSONGKAN KERANJANG
  void kosongkanKeranjang() {
    cartItems.clear();
    quantities.clear();
  }
}