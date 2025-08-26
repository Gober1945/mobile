import 'package:flutter/material.dart';
import 'transfer.dart';
import 'infokelompok.dart';
import 'riwayat.dart'; // <-- Tambahkan import ini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BerandaPage(),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bagian Header
              Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama & No Rekening
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Nama Pemilik Rekening",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "No. Rekening : 98374298973943",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications,
                                  color: Colors.white),
                            ),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  "21",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 16),
                    // Saldo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Total Saldo",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14)),
                            SizedBox(height: 4),
                            Text("Rp 1.000.000",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RiwayatPage(), // <-- Pindah ke RiwayatPage
                              ),
                            );
                          },
                          child: const Text("Riwayat",
                              style: TextStyle(color: Colors.orange)),
                        )
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Tabungan dan Deposito
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tabungan: Rp 1.000.000",
                            style: TextStyle(color: Colors.white)),
                        Row(
                          children: [
                            const Text("Deposito: Rp 0",
                                style: TextStyle(color: Colors.white)),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow[700]),
                              onPressed: () {},
                              child: const Text("Buka Deposito",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Grid Menu
              Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    // Transfer (ada fungsi)
                    _buildMenuItem(Icons.send, "Transfer", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransferPage(),
                        ),
                      );
                    }),
                    _buildMenuItem(Icons.arrow_downward, "Tarik Tunai", () {}),
                    _buildMenuItem(Icons.arrow_upward, "Setor Tunai", () {}),
                    _buildMenuItem(Icons.account_balance_wallet, "Top Up E-Wallet", () {}),
                    _buildMenuItem(Icons.savings, "Deposito", () {}),
                    
                    // Pengaturan (pindah ke InfoKelompok)
                    _buildMenuItem(Icons.settings, "Pengaturan", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoKelompok(),
                        ),
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows), label: "Bayar/Transfer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: "Deposito"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Saya"),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
