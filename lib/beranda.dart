import 'package:flutter/material.dart';
import 'transfer.dart';
import 'infokelompok.dart';
import 'profil.dart';
import 'profil_data.dart';
import 'isisaldo.dart';

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

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  bool _isVisible = true; // default: saldo kelihatan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bagian Header
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Bagian atas: profil + notifikasi
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            );
                          },
                          child: ValueListenableBuilder<ProfileData>(
                            valueListenable: profileNotifier,
                            builder: (context, profile, _) => CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                profile.avatar == 1
                                    ? Icons.face
                                    : profile.avatar == 2
                                        ? Icons.star
                                        : Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ValueListenableBuilder<ProfileData>(
                          valueListenable: profileNotifier,
                          builder: (context, profile, _) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.nama,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "No. Rekening : 98374298973943",
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications,
                                  color: Colors.orange),
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

                    const SizedBox(height: 12),

                    // Card saldo
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<int>(
                            valueListenable: saldoNotifier,
                            builder: (context, saldo, _) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Total Saldo",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            _isVisible
                                                ? "Rp ${saldo.toString()}"
                                                : "*****",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isVisible = !_isVisible;
                                              });
                                            },
                                            child: Icon(
                                              _isVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text("Riwayat >"),
                                  ),
                                ],
                              );
                            },
                          ),

                          const SizedBox(height: 16),
                          const Divider(color: Colors.white70),

                          const SizedBox(height: 12),

                          // Tabungan dan Deposito
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Tabungan   >",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 4),
                                  Text(
                                    "Rp 1.000.000",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("Deposito   >",
                                      style: TextStyle(color: Colors.white)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Text(
                                        "Rp 0",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellow[700],
                                          foregroundColor: Colors.brown,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Buka Deposito",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                    _buildMenuItem(Icons.arrow_upward, "Setor Tunai", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IsiSaldoPage(),
                        ),
                      );
                    }),
                    _buildMenuItem(
                        Icons.account_balance_wallet, "Top Up E-Wallet", () {}),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows), label: "Bayar/Transfer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: "Deposito"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Saya"),
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
