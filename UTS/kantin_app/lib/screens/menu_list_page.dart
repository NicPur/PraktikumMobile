import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu.dart';
import '../widgets/custom_text.dart';
import 'add_menu_page.dart';
import 'detail_page.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  // Minimal 5 data awal
  final List<MenuKantin> daftarMenu = [
    MenuKantin(nama: "Nasi Goreng Kantin", harga: 15000),
    MenuKantin(nama: "Ayam Geprek Sambal Ijo", harga: 18000),
    MenuKantin(nama: "Mie Ayam Bakso", harga: 13000),
    MenuKantin(nama: "Soto Ayam Madura", harga: 14000),
    MenuKantin(nama: "Es Teh Manis Jumbo", harga: 5000),
  ];

  Future<void> _keHalamanTambah() async {
    final result = await Get.to(() => const AddMenuPage());
    if (result != null && result is MenuKantin) {
      setState(() {
        daftarMenu.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Daftar Menu Kantin",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomText(
              text: "Pilihan Menu Hari Ini",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = daftarMenu[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.fastfood,
                      color: Colors.blue,
                    ),
                    title: CustomText(
                      text: menu.nama,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: CustomText(
                      text: "Rp ${menu.harga.toStringAsFixed(0)}",
                      color: Colors.grey[700],
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Get.to(() => DetailPage(menu: menu));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _keHalamanTambah,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}