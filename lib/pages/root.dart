import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';

// RootPage berfungsi sebagai kerangka/kontainer utama aplikasi
// yang mengelola navigasi antar tab menggunakan BottomNavigationBar
class RootPage extends StatefulWidget {
  // Menerima data username yang dikirim dari halaman Login
  final String username;

  const RootPage({super.key, required this.username});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // Menyimpan indeks tab/halaman yang sedang aktif dipilih (0 = Home, 1 = Profile)
  int selectedIndex = 0;

  // Fungsi untuk mengubah indeks halaman aktif dan memperbarui UI
  void changePage(int index) {
    // setState memberitahu Flutter bahwa selectedIndex berubah,
    // sehingga tampilan body dan tab aktif akan digambar ulang (rebuild)
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Daftar halaman yang dapat diakses melalui bottom navigation bar
    // Data username diteruskan ke ProfilePage menggunakan widget.username
    List<Widget> pages = [
      const HomePage(),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      // Menampilkan widget halaman sesuai dengan index yang sedang aktif (0: HomePage, 1: ProfilePage)
      body: pages[selectedIndex],

      // Navigasi bawah untuk berpindah antar tab
      bottomNavigationBar: BottomNavigationBar(
        // Menentukan tab mana yang disorot/aktif saat ini
        currentIndex: selectedIndex,
        // Fungsi callback yang dipanggil saat salah satu item tab ditekan oleh user
        onTap: changePage,

        // Item-item tab yang tersedia pada navigasi bawah
        items: const [
          // Tab indeks ke-0: Home
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          // Tab indeks ke-1: Profile
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
