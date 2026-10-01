import 'package:flutter/material.dart';
import 'login.dart';

// Halaman Profil pengguna
// Menggunakan StatelessWidget karena halaman ini hanya menampilkan informasi profil yang dioper
class ProfilePage extends StatelessWidget {
  // Menerima data nama pengguna (username) yang di-passing dari RootPage
  final String username;

  const ProfilePage({super.key, required this.username});

  // Fungsi untuk menangani proses logout pengguna
  void logout(BuildContext context) {
    // pushAndRemoveUntil digunakan untuk berpindah ke LoginPage sekaligus menghapus
    // seluruh riwayat tumpukan halaman sebelumnya (dengan kondisi predicate: (route) => false).
    // Hal ini memastikan pengguna tidak bisa menekan tombol kembali (back) untuk masuk ke profil lagi.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Memposisikan seluruh item di tengah vertikal
          children: [
            // Container pembungkus avatar pengguna berbentuk lingkaran
            Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Membuat bentuk bulat sempurna
                color: Color(0xFFE9D9FF), // Warna background ungu muda
              ),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.deepPurple, // Ikon pengguna berwarna ungu tua
              ),
            ),

            const SizedBox(height: 20),

            // Teks label kecil "Username"
            const Text("Username", style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 5),

            // Menampilkan nama pengguna yang sedang aktif login
            Text(
              username,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            // Tombol Logout dengan ikon keluar
            ElevatedButton.icon(
              onPressed: () {
                // Memanggil fungsi logout dan meneruskan BuildContext
                logout(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
