import 'package:flutter/material.dart';

class InfoKelompok extends StatelessWidget {
  final List<Map<String, String>> anggota = [
    {"nama": "Afria Reva Ferdinand", "absen": "03"},
    {"nama": "Ahmad Amirul Fauzan", "absen": "04"},
    {"nama": "Azzahra Nurayu Mutiara", "absen": "07"},
    {"nama": "Dinda Firmanda", "absen": "17"},
  ];

  const InfoKelompok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Kelompok"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.orange.shade50,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: anggota.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  anggota[index]["nama"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("No. Absen : ${anggota[index]["absen"]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
