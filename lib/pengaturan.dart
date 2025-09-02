import 'package:flutter/material.dart';
import 'infokelompok.dart'; 

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.group, color: Colors.orange),
            title: const Text("Informasi Kelompok"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoKelompok()),
              );
            },
          ),
        ],
      ),
    );
  }
}
