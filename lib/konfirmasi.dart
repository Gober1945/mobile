import 'package:flutter/material.dart';
import 'tranferberhasil.dart';
import 'profil_data.dart';

class KonfirmasiTransfer extends StatelessWidget {
  final int nominal;
  final String namaPenerima;
  final String noRekening;
  final String catatan; // 🔹 Tambahkan variabel catatan

  const KonfirmasiTransfer({
    super.key,
    required this.nominal,
    required this.namaPenerima,
    required this.noRekening,
    this.catatan = "", // default kosong
  });

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
            // 🔸 Pengirim
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ValueListenableBuilder<ProfileData>(
                    valueListenable: profileNotifier,
                    builder: (context, profile, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "No. Rekening : 8537429837943",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 🔸 Penerima
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
                    children: [
                      Text(
                        namaPenerima,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "No. Rekening : $noRekening",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 🔸 Card jumlah transfer
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _rowText("Jumlah Transfer", "Rp$nominal"),
                    const SizedBox(height: 12),
                    _rowText("Biaya Transfer", "Gratis",
                        textColor: Colors.green),
                    _rowText(
                      "Catatan",
                      catatan.isNotEmpty ? catatan : "Tidak ada catatan",
                    ),
                    const Divider(height: 24),
                    _rowText(
                      "Total",
                      "Rp$nominal",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // 🔸 Tombol Konfirmasi
            ElevatedButton(
              onPressed: () {
                if (saldoNotifier.value >= nominal) {
                  saldoNotifier.value -= nominal;

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferSuccessPage(
                        namaPenerima: namaPenerima,
                        noRekening: noRekening,
                        nominal: nominal,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Saldo tidak mencukupi")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Konfirmasi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔧 Fungsi baris teks
  Widget _rowText(
    String left,
    String right, {
    Color textColor = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: const TextStyle(color: Colors.black)),
        Flexible(
          child: Text(
            right,
            textAlign: TextAlign.end,
            style: TextStyle(color: textColor, fontWeight: fontWeight),
          ),
        ),
      ],
    );
  }
}
