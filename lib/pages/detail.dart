import 'package:flutter/material.dart';
import '../data.dart';

// Halaman Detail yang menampilkan informasi lengkap dari sebuah menu makanan/minuman
// Menggunakan StatelessWidget karena halaman ini hanya menerima dan menampilkan data statis
class DetailPage extends StatelessWidget {
  // Menerima data objek 'menu' yang dikirim/di-passing dari HomePage saat item diklik
  final Product menu;

  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menampilkan nama menu sebagai judul pada AppBar di bagian atas layar
        title: Text(menu.productName),
      ),

      // SingleChildScrollView mencegah tampilan error overflow jika konten melebihi tinggi layar ponsel
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect digunakan untuk memotong gambar agar memiliki sudut melengkung (rounded)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                menu.imageUrl,
                width: double
                    .infinity, // Lebar gambar memenuhi layar secara horizontal
                height: 220, // Tinggi area gambar 220 piksel
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(Icons.fastfood, size: 80),
                  );
                },
              ),
            ),

            const SizedBox(height: 20), // Jarak pemisah vertikal
            // Teks Nama Menu dengan ukuran font besar dan tebal
            Text(
              menu.productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              menu.type,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 8),

            // Teks Harga Menu dengan warna hijau
            Text(
              menu.price,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Jumlah Produk",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            Text("${menu.likeCount} total like"),
            Text("Stok: ${menu.stock}"),
            const SizedBox(height: 20),
            const Text(
              "Ukuran",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(menu.sizes.toString(), style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 8),

            const SizedBox(height: 20),
            // Judul sub-bagian "Deskripsi"
            const Text(
              "Deskripsi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Paragraf deskripsi produk
            Text(menu.details, style: const TextStyle(fontSize: 15)),

            const SizedBox(height: 25),

            // Tombol 'Kembali ke Home' yang membentang selebar layar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigator.pop bertugas menutup halaman saat ini dan kembali ke halaman sebelumnya
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Kembali ke Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
