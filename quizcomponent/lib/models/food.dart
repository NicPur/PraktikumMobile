class Food {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Food({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

List<Food> foods = [
  Food(
    name: "Burger Spesial",
    price: 25000,
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.S_fwoXNDM1aFS4K2fJfJ_gHaE8?r=0&pid=Api&h=220&P=0",
    description: "Burger dengan daging dan sayuran segar.",
  ),
  Food(
    name: "Mie Ayam",
    price: 15000,
    imageUrl: "https://tse3.mm.bing.net/th/id/OIP.d029-yJY9Kn-rhCpIiFeDAHaHa?r=0&pid=Api&h=220&P=0",
    description: "Mie ayam dengan topping ayam dan sayuran.",
  ),
  Food(
    name: "Nasi Goreng",
    price: 20000,
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.0DOC8Xipa2CsyXFHwDXbNgHaHa?r=0&pid=Api&h=220&P=0",
    description: "Nasi goreng spesial dengan telur dan ayam.",
  ),
];