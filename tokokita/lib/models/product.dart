// PRAKTIKUM 2 - DASAR DART
// TOKOKITA

// VARIABLES & DATA TYPES
const String toko = "TokoKita";
final String pemilik = "Nico";

var nama = "Laptop";
int stok = 15;
double harga = 5000000;
String kategori = "Elektronik";
bool tersedia = true;

List<String> kategoriList = ["Elektronik", "Fashion", "Makanan"];

Map<String, dynamic> dataProduk = {
  "nama": nama,
  "harga": harga,
  "stok": stok
};

// OPERATORS
void operatorDemo() {
  int jumlah = 2;

  print(harga + 100000);
  print(harga - 100000);
  print(harga * jumlah);
  print(harga / jumlah);
  print(harga % 100000);

  print(harga == 5000000);
  print(harga != 3000000);
  print(harga > 1000000);
  print(harga < 10000000);
  print(harga >= 5000000);
  print(harga <= 5000000);

  print(tersedia && stok > 0);
  print(tersedia || stok > 0);
  print(!tersedia);
}

// CONTROL STRUCTURE
String statusStok(int stok) {
  if (stok > 5) {
    return "Tersedia";
  } else if (stok > 0) {
    return "Stok Terbatas";
  }
  return "Habis";
}

double totalHarga(List<double> hargaList) {
  double total = 0;

  for (double harga in hargaList) {
    total += harga;
  }

  return total;
}

void prosesStok(int stok) {
  while (stok > 0) {
    stok--;
  }
  print("Stok habis: $stok");
}

double diskonKategori(String kategori) {
  switch (kategori) {
    case "Elektronik":
      return 10;
    case "Fashion":
      return 15;
    case "Makanan":
      return 5;
    default:
      return 0;
  }
}

// FUNCTIONS
double hitungDiskon(double harga, double persen) {
  return harga - (harga * persen / 100);
}

double hargaSetelahDiskon(
  double harga, {
  double persen = 0,
}) {
  return hitungDiskon(harga, persen);
}
String rupiah(double harga) => "Rp ${harga.toStringAsFixed(0)}";

// OOP
class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;
  String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  String getStatusStok() => statusStok(stock);
}

// INHERITANCE
class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double getHargaFinal() =>
      hitungDiskon(price, discountPercent);
}

// DUMMY PRODUCTS
List<Product> products = [
  Product(
    id: 1,
    name: "Laptop",
    price: 5000000,
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.aZSkOtajHhtXsusl-Em77AHaEc?r=0&pid=Api&h=220&P=0",
    category: "Elektronik",
    stock: 10,
  ),
  Product(
    id: 2,
    name: "HP",
    price: 3000000,
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.lzGXRQWt7abDeVf2r72blgHaEK?r=0&pid=Api&h=220&P=0",
    category: "Elektronik",
    stock: 0,
  ),
  Product(
    id: 3,
    name: "Headset",
    price: 350000,
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.lLHeZSNMf7u8pC0twPjGWgHaIo?r=0&pid=Api&h=220&P=0",
    category: "Elektronik",
    stock: 3,
  ),
  Product(
    id: 4,
    name: "Jaket",
    price: 250000,
    imageUrl: "https://www.bfgcdn.com/1500_1500_90/005-4079/the-north-face-extreme-pile-fullzip-jacket-fleece-jacket.jpg",
    category: "Fashion",
    stock: 8,
  ),
  Product(
    id: 5,
    name: "Sepatu",
    price: 450000,
    imageUrl: "https://tse4.mm.bing.net/th/id/OIP.moGwMEBc-dJ1JbwNo7qL5QHaHa?r=0&pid=Api&h=220&P=0",
    category: "Fashion",
    stock: 2,
  ),
  Product(
    id: 6,
    name: "Kaos",
    price: 100000,
    imageUrl: "https://tse1.mm.bing.net/th/id/OIP.zcQ5n8nP1xnQ0vzvZogAOQHaHa?r=0&pid=Api&h=220&P=0",
    category: "Fashion",
    stock: 12,
  ),
  Product(
    id: 7,
    name: "Celana",
    price: 150000,
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.l93o5Hykb2hJV0bdgIQFwAHaHa?r=0&pid=Api&h=220&P=0",
    category: "Fashion",
    stock: 20,
  ),
  Product(
    id: 8,
    name: "Kopi",
    price: 20000,
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.ewnGqDbeNnBtdsxZviQlOQHaE7?r=0&pid=Api&h=220&P=0",
    category: "Makanan",
    stock: 2,
  ),
];

// TOTAL BELANJA
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;

  for (Product p in keranjang) {
    total += p.price;
  }

  return total;
}

// MAIN
void main() {
  print("=== TOKOKITA ===");

  print("Toko: $toko");
  print("Pemilik: $pemilik");
  print("Produk: $nama");
  print("Harga: ${rupiah(harga)}");
  print("Stok: $stok");
  print("Status: ${statusStok(stok)}");

  print("\n=== OPERATOR ===");
  operatorDemo();

  print("\n=== TOTAL HARGA ===");
  print(rupiah(totalHarga([harga, 100000, 200000])));

  print("\n=== WHILE ===");
  prosesStok(3);

  print("\n=== DISKON ===");
  double diskon = diskonKategori(kategori);
  print("$diskon%");
  print(rupiah(hargaSetelahDiskon(
    harga,
    persen: diskon,
  )));

  print("\n=== PRODUCT ===");
  Product p = products[0];
  print(p.name);
  print(p.getStatusStok());

  print("\n=== DISCOUNTED PRODUCT ===");
  DiscountedProduct dp = DiscountedProduct(
    id: 9,
    name: "Tablet",
    price: 2000000,
    imageUrl: "tablet.jpg",
    category: "Elektronik",
    stock: 6,
    discountPercent: 10,
  );

  print(dp.name);
  print(rupiah(dp.getHargaFinal()));

  print("\n=== 8 PRODUCTS ===");
  for (Product p in products) {
    print(
      "${p.name} - ${rupiah(p.price)} - ${p.getStatusStok()}",
    );
  }

  print("\n=== TOTAL BELANJA ===");
  print(rupiah(hitungTotalBelanja(products)));

  print("\n=== NULL SAFETY ===");
  print(p.description ?? "Tidak ada deskripsi");
}