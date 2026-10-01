import 'package:flutter/material.dart';
import '../data.dart';
import 'detail.dart';

// Halaman utama (Home) yang menampilkan daftar menu dan fitur filter kategori
// Menggunakan StatefulWidget karena kategori yang dipilih (selectedCategory) dapat berubah-ubah
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variabel untuk menyimpan kategori yang sedang aktif/dipilih oleh user, defaultnya "Semua"
  String selectedCategory = "Semua";

  @override
  Widget build(BuildContext context) {
    // Logika filter data menu:
    // 1. Jika "Semua" dipilih, tampilkan seluruh item dari list 'menus'.
    // 2. Jika bukan "Semua", filter list menu yang kategorinya sama persis dengan selectedCategory.
    List<Product> filteredMenus = selectedCategory == "Semua"
        ? catalog
        : catalog.where((m) => m.type == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              // Memberikan jarak yang seimbang antar tombol filter di baris horizontal
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  [
                    "Semua",
                    "T-Shirt",
                    "Jacket",
                    "Pants",
                    "Bag",
                    "Accessories",
                  ].map((cat) {
                    return ChoiceChip(
                      label: Text(cat),
                      selected: selectedCategory == cat,
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = cat;
                        });
                      },
                    );
                  }).toList(),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredMenus.length,
              itemBuilder: (context, index) {
                // Mengambil objek data Menu sesuai urutan indeks baris saat ini
                Product menu = filteredMenus[index];
                return Card(
                  // Memberi jarak margin di sekeliling kartu
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Membuat sudut gambar agak melengkung
                      child: Image.network(
                        menu.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit
                            .cover, // Memotong gambar secara proporsional agar memenuhi kotak 60x60
                        // errorBuilder: Penanganan fallback jika gambar gagal dimuat dari internet (misal: koneksi error/link mati)
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.fastfood, size: 50),
                      ),
                    ),

                    // Bagian 'title': Nama menu dengan teks tebal
                    title: Text(
                      menu.productName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    // Bagian 'subtitle': Menampilkan teks kategori dan harga di bawah judul
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu.price,
                          style: const TextStyle(
                            color: Colors.green, // Warna hijau untuk harga
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(menu.likeCount.toString() + " Likes"),
                        Text("Stok: ${menu.stock}"),
                      ],
                    ),

                    // Bagian 'trailing': Ikon panah penunjuk di sisi paling kanan ListTile
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),

                    // onTap: Fungsi yang dijalankan ketika salah satu item kartu menu ditekan
                    onTap: () {
                      // Berpindah ke DetailPage sambil membawa data objek 'menu' yang dipilih
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(menu: menu),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
