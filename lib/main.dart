import 'package:flutter/material.dart';
import 'transfer.dart';
import 'riwayat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Banking',
      // halaman pertama yang terbuka
      home: const HomePage(),
      routes: {
        '/transfer': (context) => const TransferPage(),
        '/riwayat': (context) => const RiwayatPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Menu Utama', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.pushNamed(context, '/transfer');
              },
              child: const Text('Buka Halaman Transfer', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.pushNamed(context, '/riwayat');
              },
              child: const Text('Buka Halaman Riwayat', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
