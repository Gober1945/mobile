import 'package:flutter/material.dart';

void main() {
  runApp(const TransferApp());
}

class TransferApp extends StatelessWidget {
  const TransferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bukti Transfer',
      debugShowCheckedModeBanner: false,
      home: const TransferSuccessPage(),
    );
  }
}

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(), // Dorong konten ke bawah

            // Judul
            const Text(
              "Transfer Berhasil",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            // Icon centang hijau
            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            // Detail Transaksi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  TransactionRow(
                      title: "Tanggal Transaksi", value: "29-12-2025"),
                  TransactionRow(title: "Nama Pengirim", value: "Tembel"),
                  TransactionRow(title: "Nama Penerima", value: "Ban Motor"),
                  TransactionRow(
                      title: "No. Rekening Tujuan", value: "124672352234"),
                  TransactionRow(
                      title: "Nominal Transaksi", value: "Rp. 300.000"),
                ],
              ),
            ),

            const Spacer(), // Dorong tombol ke bawah

            // Tombol Kembali
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  "Kembali",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionRow extends StatelessWidget {
  final String title;
  final String value;

  const TransactionRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}