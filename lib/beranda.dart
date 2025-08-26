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
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DepositoPage(),
                            ),
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

            // MENU GRID
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _menuItem(context, Icons.send, "Transfer", TransferPage()),
                _menuItem(context, Icons.settings, "Pengaturan", SettingPage()),
              ],
            ),
          ],
        ),
      ),

      // NAVBAR BAWAH
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
