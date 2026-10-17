import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  late final CartController cartController;

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),

          BottomNavigationBarItem(
            icon: Obx(
              () => Badge(
                isLabelVisible:
                    cartController.totalItem > 0,
                label: Text(
                  cartController.totalItem.toString(),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
            label: "Keranjang",
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}