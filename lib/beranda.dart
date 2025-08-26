import 'package:flutter/material.dart';

void main() {
  runApp(MyBankingApp());
}

class MyBankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Banking',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ================= HALAMAN BERANDA =================
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SALDO
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Saldo", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 5),
                  Text("Rp 1.000.000",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tabungan: Rp 1.000.000",
                          style: TextStyle(color: Colors.white)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DepositoPage()),
                          );
                        },
                        child: Text("Buka Deposito",
                            style: TextStyle(color: Colors.orange)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // MENU
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _menuItem(context, Icons.send, "Transfer", TransferPage()),
                _menuItem(context, Icons.arrow_downward, "Tarik Tunai", TarikTunaiPage()),
                _menuItem(context, Icons.arrow_upward, "Setor Tunai", SetorTunaiPage()),
                _menuItem(context, Icons.account_balance_wallet, "Top Up E-Wallet", TopUpPage()),
                _menuItem(context, Icons.savings, "Deposito", DepositoPage()),
                _menuItem(context, Icons.settings, "Pengaturan", SettingPage()),
              ],
            )
          ],
        ),
      ),

      // NAVBAR BAWAH
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.send), label: "Bayar/Transfer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.savings), label: "Deposito"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Saya"),
        ],
      ),
    );
  }

  // widget menu
  Widget _menuItem(BuildContext context, IconData icon, String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// ================= HALAMAN TRANSFER =================
class TransferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transfer")),
      body: Center(
        child: Text("Halaman Transfer"),
      ),
    );
  }
}

// ================= HALAMAN TARIK TUNAI =================
class TarikTunaiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tarik Tunai")),
      body: Center(
        child: Text("Halaman Tarik Tunai"),
      ),
    );
  }
}

// ================= HALAMAN SETOR TUNAI =================
class SetorTunaiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setor Tunai")),
      body: Center(
        child: Text("Halaman Setor Tunai"),
      ),
    );
  }
}

// ================= HALAMAN TOP UP =================
class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Top Up E-Wallet")),
      body: Center(
        child: Text("Halaman Top Up"),
      ),
    );
  }
}

// ================= HALAMAN DEPOSITO =================
class DepositoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deposito")),
      body: Center(
        child: Text("Halaman Deposito"),
      ),
    );
  }
}

// ================= HALAMAN PENGATURAN =================
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.group, color: Colors.orange),
            title: Text("Informasi Kelompok"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoKelompokPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ================= HALAMAN INFORMASI KELOMPOK =================
class InfoKelompokPage extends StatelessWidget {
  final List<Map<String, String>> anggota = [
    {"nama": "Afria Reva Ferdinand", "absen": "03"},
    {"nama": "Ahmad Amirul Fauzan", "absen": "04"},
    {"nama": "Azzahra Nurayu Mutiara", "absen": "07"},
    {"nama": "Dinda Firmanda", "absen": "17"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi Kelompok"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.orange.shade50,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: anggota.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  anggota[index]["nama"]!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("No. Absen : ${anggota[index]["absen"]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
