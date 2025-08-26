import 'package:flutter/material.dart';
import 'info_kelompok_page.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.group, color: Colors.orange),
            title: Text("Informasi Kelompok"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoKelompokPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
