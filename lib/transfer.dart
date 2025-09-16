import 'package:flutter/material.dart';
import 'konfirmasi.dart';
import 'profil_data.dart';

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
      resizeToAvoidBottomInset: true, // 👉 biar konten naik pas keyboard muncul
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profil Pengguna
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.nama,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('SeaBank : 98374298973943'),
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
              const SizedBox(height: 20),

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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
}
