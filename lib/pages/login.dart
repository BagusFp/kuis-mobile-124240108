import 'package:flutter/material.dart';
import '../data.dart';
import 'root.dart';

// Halaman Login menggunakan StatefulWidget karena ada perubahan state (input teks & pesan error)
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessage = "";

  void login() {
    if (usernameController.text == account.username &&
        passwordController.text == account.password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RootPage(username: usernameController.text),
        ),
      );
    } else {
      setState(() {
        errorMessage =
            usernameController.text.isEmpty || passwordController.text.isEmpty
            ? "Username dan password harus diisi"
            : "Username atau password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Wadah kotak putih pembungkus logo
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  "https://play-lh.googleusercontent.com/bB_cyOTbQfFmV4IaeqTIFJVc1Wm4UdQwQai8GjthG4uaXrTHNZTKsMtg9_9058GeZGLgoJzIasYYdFkSvdyQ",
                  height: 180,
                ),
              ),
              const SizedBox(height: 10), // Jarak vertikal 10px
              // Teks sambutan di bawah logo
              const Text(
                "Selamat Datang di Uniqlo ",
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                "Selamat Berbelanja",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Form input teks Username
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "username", // Teks bayangan sebagai petunjuk input
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ), // Sudut input dibuat membulat
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Form input teks Password
              TextField(
                controller: passwordController,
                obscureText:
                    true, // Menyamarkan teks input dengan bulatan hitam (bintang/sensor)
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              // Menampilkan widget teks pesan error HANYA jika variabel errorMessage tidak kosong
              if (errorMessage.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                  ), // Teks berwarna merah untuk tanda peringatan
                ),
              ],
              const SizedBox(height: 20),

              // Tombol Login
              ElevatedButton(
                onPressed:
                    login, // Menjalankan fungsi login() saat tombol ditekan
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape:
                      const StadiumBorder(), // Membuat bentuk tombol lonjong seperti stadion
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
