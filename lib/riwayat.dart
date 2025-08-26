import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transaksi = [
      {
        'nama': 'Dinda Firmanda',
        'tipe': 'Transfer',
        'tanggal': '28 Jul 2025, 09:33',
        'nominal': 145093,
        'tipe_transaksi': 'masuk',
      },
      {
        'nama': 'Dinda Firmanda',
        'tipe': 'Transfer',
        'tanggal': '28 Jul 2025, 09:33',
        'nominal': 145093,
        'tipe_transaksi': 'keluar',
      },
      {
        'nama': 'Dinda Firmanda',
        'tipe': 'Transfer',
        'tanggal': '28 Jul 2025, 09:33',
        'nominal': 145093,
        'tipe_transaksi': 'masuk',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Riwayat Transaksi', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cari . . .',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tanggal Riwayat
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: Colors.grey[300],
              child: const Text(
                '28 Juli 2025',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // List Transaksi
            Expanded(
              child: ListView.builder(
                itemCount: transaksi.length,
                itemBuilder: (context, index) {
                  final item = transaksi[index];
                  final isMasuk = item['tipe_transaksi'] == 'masuk';
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.orange,
                    ),
                    title: Text(item['nama'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['tipe']),
                        Text(item['tanggal'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    trailing: Text(
                      '${isMasuk ? '+' : '-'}Rp ${item['nominal'].toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                      style: TextStyle(
                        color: isMasuk ? Colors.green : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}