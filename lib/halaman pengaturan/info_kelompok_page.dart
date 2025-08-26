import 'package:flutter/material.dart';

class InfoKelompokPage extends StatelessWidget {
  final List<Map<String, String>> anggota = [
    {"nama": "Afria Reva Ferdinand", "absen": "03"},
    {"nama": "Ahmad Amirul Fauzan", "absen": "04"},
    {"nama": "Azzahra Nurayu Mutiara", "absen": "07"},
    {"nama": "Dinda Firmanda", "absen": "17"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi Kelompok"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.orange.shade50,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: anggota.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  anggota[index]["nama"]!,
                  style: TextStyle(fontWeight: FontWeight.bold),
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
