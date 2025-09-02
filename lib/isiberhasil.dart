import 'package:flutter/material.dart';
import 'beranda.dart';

class IsiBerhasilPage extends StatelessWidget {
  final int nominal;

  const IsiBerhasilPage({super.key, required this.nominal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Saldo Telah Masuk",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.check_circle, color: Colors.green, size: 120),
              const SizedBox(height: 30),

              // Detail transaksi
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow("Tanggal Transaksi", _todayDate()),
                  _buildRow("No. Rekening Tujuan", "124672352234"),
                  _buildRow("Nominal Transaksi", "Rp $nominal"),
                ],
              ),

              const SizedBox(height: 50),

              // Tombol kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const BerandaPage()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Kembali",
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // widget helper untuk membuat baris label + value
  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // otomatis ambil tanggal hari ini
  static String _todayDate() {
    final now = DateTime.now();
    return "${now.day}-${now.month}-${now.year}";
  }
}
