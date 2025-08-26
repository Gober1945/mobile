import 'package:flutter/material.dart';

class BerhasilTransfer extends StatelessWidget {
  const BerhasilTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              const Text(
                "Transfer Berhasil",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Icon(Icons.check_circle,
                  color: Colors.green, size: 80),
              const SizedBox(height: 20),

              // Detail transaksi
              _rowText("Tanggal Transaksi", "29-12-2025"),
              _rowText("Nama Pengirim", "Tembel"),
              _rowText("Nama Penerima", "Ban Motor"),
              _rowText("No. Rekening Tujuan", "124672352234"),
              _rowText("Nominal Transaksi", "Rp. 300.000"),

              const SizedBox(height: 20),

              // Tombol kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // balik ke konfirmasi
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Kembali",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowText(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left),
          Text(right),
        ],
      ),
    );
  }
}
