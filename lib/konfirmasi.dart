import 'package:flutter/material.dart';
import 'berhasil.dart'; // import file berhasil.dart

class KonfirmasiTransfer extends StatelessWidget {
  const KonfirmasiTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfirmasi"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian pengirim & penerima
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Pengirim dana",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("No. Rekening : 8537429837943"),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Penerima dana",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("No. Rekening : 8537429837943"),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            // Card jumlah transfer
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _rowText("Jumlah Transfer", "Rp1.250.000"),
                    const SizedBox(height: 12),
                    _rowText("Biaya Transfer", "Gratis",
                        textColor: Colors.green),
                    const Divider(height: 24),
                    _rowText("Total", "Rp1.250.000",
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Tombol Konfirmasi
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BerhasilTransfer()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Konfirmasi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowText(String left, String right,
      {Color textColor = Colors.black,
      FontWeight fontWeight = FontWeight.normal}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left),
        Text(
          right,
          style: TextStyle(color: textColor, fontWeight: fontWeight),
        ),
      ],
    );
  }
}
