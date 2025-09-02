import 'package:flutter/material.dart';
import 'profil_data.dart';

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

            const Text(
              "Transfer Berhasil",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ValueListenableBuilder<ProfileData>(
                    valueListenable: profileNotifier,
                    builder: (context, profile, _) {
                      return _buildDetailRow('Nama Pengirim', profile.nama);
                    },
                  ),
                  ValueListenableBuilder<ProfileData>(
                    valueListenable: profileNotifier,
                    builder: (context, profile, _) {
                      return _buildDetailRow('No. Rekening', "8537429837943");
                    },
                  ),

                  _buildDetailRow('Nama Penerima', namaPenerima),

                  // Nomor rekening
                  _buildDetailRow('No. Rekening', noRekening),

                  // Nominal transfer
                  _buildDetailRow(
                    'Nominal Transfer',
                    'Rp ${nominal.toString()}',
                  ),
                ],
              ),
            ),

            const Spacer(),

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
                    color: Color.fromARGB(255, 255, 255, 255),
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
