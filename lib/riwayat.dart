import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Transaksi"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Contoh riwayat transaksi masuk
          _buildRiwayatItem(
            icon: Icons.arrow_downward,
            title: "Transfer Masuk",
            subtitle: "Dari: 08573291234",
            amount: "+ Rp500.000",
            amountColor: Colors.green,
          ),
          const SizedBox(height: 10),

          // Contoh riwayat transaksi keluar
          _buildRiwayatItem(
            icon: Icons.arrow_upward,
            title: "Transfer Keluar",
            subtitle: "Ke: 0897654321",
            amount: "- Rp250.000",
            amountColor: Colors.red,
          ),
          const SizedBox(height: 10),

          _buildRiwayatItem(
            icon: Icons.arrow_upward,
            title: "Transfer Keluar",
            subtitle: "Ke: 08765432123",
            amount: "- Rp1.000.000",
            amountColor: Colors.red,
          ),
          const SizedBox(height: 10),

          _buildRiwayatItem(
            icon: Icons.arrow_downward,
            title: "Transfer Masuk",
            subtitle: "Dari: 08123456789",
            amount: "+ Rp200.000",
            amountColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildRiwayatItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: amountColor,
          ),
        ),
      ),
    );
  }
}
