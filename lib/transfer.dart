import 'package:flutter/material.dart';
<<<<<<< HEAD

<<<<<<< HEAD
=======

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Banking',
      home: TransferPage(),
    );
  }
}
=======
import 'konfirmasi.dart';
import 'profil_data.dart';
>>>>>>> 7a37cc06ecba2772c331f9ece57d169504198900

>>>>>>> b2b58a0c45218ab22f06586579d0f5ee3bd32b0e
class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController noRekCtrl = TextEditingController();
    final TextEditingController namaCtrl = TextEditingController();
    final TextEditingController nominalCtrl = TextEditingController();
    final TextEditingController catatanCtrl = TextEditingController();
    final profile = profileNotifier.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Transfer', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profil Pengguna
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.nama,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('SeaBank : 98374298973943'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Input Data Transfer
            TextField(
              controller: noRekCtrl,
              decoration: InputDecoration(
                labelText: 'Masukkan No. Rekening Tujuan',
                filled: true,
                fillColor: Colors.grey[300],
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: namaCtrl,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama Penerima',
                filled: true,
                fillColor: Colors.grey[300],
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nominalCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nominal Transfer',
                filled: true,
                fillColor: Colors.grey[300],
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: const Text('Saldo Anda : Rp. 1.000.000'),
            ),
            const SizedBox(height: 16),

            // Catatan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: TextField(
                controller: catatanCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Catatan (tidak wajib)',
                  border: InputBorder.none,
                ),
              ),
            ),
            const Spacer(),

            // Tombol Lanjut
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  final nominal = int.tryParse(nominalCtrl.text.trim()) ?? 0;

                  if (nominal <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Nominal tidak valid")),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KonfirmasiTransfer(
                        nominal: nominal,
                        namaPenerima: namaCtrl.text.trim(),
                        noRekening: noRekCtrl.text.trim(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Lanjut',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
