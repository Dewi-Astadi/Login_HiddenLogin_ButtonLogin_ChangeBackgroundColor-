import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Profil App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const Login2Screen(), // Halaman login awal
    );
  }
}

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tampilPassword = true;

  showPassword() {
    setState(() {
      tampilPassword = !tampilPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController),
            TextField(
              obscureText: tampilPassword,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "password",
                hintText: "masukkan password",
                suffixIcon: IconButton(
                  onPressed: () {
                    showPassword();
                  },
                  icon: Icon(
                    tampilPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(
                      name: "Pengguna",
                      nim: "1234567890",
                      email: "pengguna@example.com",
                      prodi: "Contoh Prodi",
                      fakultas: "Contoh Fakultas",
                      angkatan: "2023",
                      status: "Aktif",
                    ),
                  ),
                );
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final String name;
  final String nim;
  final String email;
  final String prodi;
  final String fakultas;
  final String angkatan;
  final String status;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.nim,
    required this.email,
    required this.prodi,
    required this.fakultas,
    required this.angkatan,
    required this.status,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color backgroundColor = const Color(0xFFF8F0E3);

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selamat datang, ${widget.name}!"),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children: [
                ElevatedButton(
                  onPressed: () => changeBackgroundColor(Colors.red[100]!),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
                  child: const Text("Merah"),
                ),
                ElevatedButton(
                  onPressed: () => changeBackgroundColor(Colors.blue[100]!),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[100]),
                  child: const Text("Biru"),
                ),
                ElevatedButton(
                  onPressed: () => changeBackgroundColor(Colors.green[100]!),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  child: const Text("Hijau"),
                ),
                ElevatedButton(
                  onPressed: () => changeBackgroundColor(const Color(0xFFF8F0E3)),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF8F0E3)),
                  child: const Text("Default"),
                ),
                ElevatedButton(
                  onPressed: () => changeBackgroundColor(Colors.amber[100]!),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[100]),
                  child: const Text("Kuning"),
                ),
                ElevatedButton(
                  onPressed: () => changeBackgroundColor(Colors.purple[100]!),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[100]),
                  child: const Text("Ungu"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
