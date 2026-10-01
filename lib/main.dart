import 'package:flutter/material.dart';
import 'pages/login.dart';

// Fungsi main() adalah titik awal (entry point) eksekusi seluruh aplikasi Flutter
void main() {
  // runApp bertugas menjalankan widget utama (root widget) dan menampilkannya ke layar
  runApp(const MyApp());
}

// MyApp adalah root widget aplikasi, menggunakan StatelessWidget karena tampilannya statis
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah widget pembungkus utama yang menyediakan fitur Material Design
    return MaterialApp(
      // Menghilangkan banner tulisan "DEBUG" di pojok kanan atas layar
      debugShowCheckedModeBanner: false,
      // Judul aplikasi yang muncul di task manager / app switcher
      title: 'Latihan Kuis Gacoan',
      // Mengatur tema global aplikasi, seperti warna utama (primarySwatch)
      theme: ThemeData(primarySwatch: Colors.blue),
      // Menentukan halaman pertama yang dibuka saat aplikasi pertama kali dijalankan (LoginPage)
      home: const LoginPage(),
    );
  }
}
