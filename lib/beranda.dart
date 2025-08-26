import 'package:flutter/material.dart';
import 'transfer.dart';
import 'pengaturan.dart';

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
                  Text(
                    "Rp 1.000.000",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Tabungan: Rp 1.000.000",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            SizedBox(height: 20),

            // MENU GRID (bisa banyak, tapi aktif cuma 2)
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _menuItem(context, Icons.send, "Transfer", TransferPage()), // aktif
                _menuItem(context, Icons.settings, "Pengaturan", SettingPage()), // aktif
                _menuItem(context, Icons.savings, "Deposito", null), // belum aktif
                _menuItem(context, Icons.qr_code, "QR Code", null), // belum aktif
                _menuItem(context, Icons.phone_android, "Pulsa", null), // belum aktif
                _menuItem(context, Icons.history, "Riwayat", null), // belum aktif
              ],
            ),
          ],
        ),
      ),

      // NAVBAR BAWAH (semua icon tetap ada)
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Bayar/Transfer"),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: "Deposito"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Saya"),
        ],
      ),
    );
  }

  /// Widget menu kotak
  Widget _menuItem(BuildContext context, IconData icon, String title, Widget? page) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$title belum tersedia")),
          );
        }
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
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
