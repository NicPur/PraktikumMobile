import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String baseUrl = 'https://fakestoreapi.com/products';

  // GET ALL PRODUCTS DARI API
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      // MENCETAK KE CONSOLE SESUAI LANGKAH 2 PRAKTIKUM
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Product> products =
            body.map((dynamic item) => Product.fromJson(item)).toList();
        return products;
      } else {
        throw Exception(
          'Gagal memuat produk (Status Code: ${response.statusCode})',
        );
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }

  // GET DETAIL PRODUCT (UNTUK TUGAS MANDIRI NO 1)
  Future<Product> fetchProductDetail(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        return Product.fromJson(body);
      } else {
        throw Exception('Gagal memuat detail produk');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }
}