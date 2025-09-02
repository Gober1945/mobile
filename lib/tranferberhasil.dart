import 'package:flutter/material.dart';
<<<<<<< HEAD

void main() {
  runApp(const TransferApp());
}

class TransferApp extends StatelessWidget {
  const TransferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bukti Transfer',
      debugShowCheckedModeBanner: false,
      home: TransferSuccessPage(),
    );
  }
}
=======
import 'profil_data.dart';
>>>>>>> 7a37cc06ecba2772c331f9ece57d169504198900

class TransferSuccessPage extends StatelessWidget {
  final String namaPenerima;
  final String noRekening;
  final int nominal;

  const TransferSuccessPage({
    super.key,
    required this.namaPenerima,
    required this.noRekening,
    required this.nominal,
  });

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
<<<<<<< HEAD
                  TransactionRow(
                      title: "Tanggal Transaksi", value: "29-12-2025"),
                  TransactionRow(title: "Nama Pengirim", value: "Tembel"),
                  TransactionRow(title: "Nama Penerima", value: "Ban Motor"),
                  TransactionRow(
                      title: "No. Rekening Tujuan", value: "124672352234"),
                  TransactionRow(
                      title: "Nominal Transaksi", value: "Rp. 300.000"),
=======
                  ValueListenableBuilder<ProfileData>(
                    valueListenable: profileNotifier,
                    builder: (context, profile, _) {
                      return _buildDetailRow('Nama Pengirim', profile.nama);
                    },
                  ),
                  const SizedBox(height: 12),
                  ValueListenableBuilder<ProfileData>(
                    valueListenable: profileNotifier,
                    builder: (context, profile, _) {
                      return _buildDetailRow('No. Rekening', "8537429837943");
                    },
                  ),
                  const SizedBox(height: 12),

                  _buildDetailRow('Nama Penerima', namaPenerima),

                  // Nomor rekening
                  _buildDetailRow('No. Rekening', noRekening),

                  // Nominal transfer
                  _buildDetailRow(
                    'Nominal Transfer',
                    'Rp ${nominal.toString()}',
                  ),
>>>>>>> 7a37cc06ecba2772c331f9ece57d169504198900
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
                  shape: const RoundedRectangleBorder(
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

  Widget _buildDetailRow(String title, String value) {
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
